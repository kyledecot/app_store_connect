# frozen_string_literal: true

require 'active_support/all'
require 'mixpanel-ruby'
require 'securerandom'

require 'app_store_connect/request'
require 'app_store_connect/authorization'
require 'app_store_connect/object'

module AppStoreConnect
  class Client
    MIXPANEL_TOKEN = '1213f2b88b9b10b13d321f4c67a55ca8'
    private_constant :MIXPANEL_TOKEN

    def initialize(**kwargs)
      @options = options(**kwargs)

      @authorization = Authorization.new(
        private_key: @options[:private_key],
        key_id: @options[:key_id],
        issuer_id: @options[:issuer_id]
      )
      @web_service_endpoints_by_alias ||= AppStoreConnect::SCHEMA
                                          .web_service_endpoints
                                          .map { |s| [s.alias, s] }
                                          .to_h
      @distinct_id = SecureRandom.uuid
      @tracker = Mixpanel::Tracker.new(MIXPANEL_TOKEN)
    end

    def respond_to_missing?(method_name, include_private = false)
      web_service_endpoint_aliases.include?(method_name) || super
    end

    def method_missing(method_name, *kwargs)
      super unless web_service_endpoint_aliases.include?(method_name)

      web_service_endpoint = web_service_endpoint_by(method_name)

      call(web_service_endpoint, *kwargs)
    end

    private

    def web_service_endpoint_aliases
      @web_service_endpoints_by_alias.keys
    end

    def call(web_service_endpoint, **kwargs)
      raise "invalid http method: #{web_service_endpoint.http_method}" unless %i[get delete post].include?(web_service_endpoint.http_method)

      request = build_request(web_service_endpoint, **kwargs)
      response = request.execute

      track(web_service_endpoint)

      return unless response.body

      JSON.parse(response.body).deep_transform_keys do |key|
        key.underscore.to_sym
      end
    end

    def track(web_service_endpoint)
      return unless @options[:analytics_enabled] == 'true'

      @tracker.track(@distinct_id, web_service_endpoint.alias)
    end

    def build_uri(web_service_endpoint, **kwargs)
      URI(web_service_endpoint
        .url
        .gsub(/(\{(\w+)\})/) { kwargs.fetch(Regexp.last_match(2).to_sym) })
    end

    def web_service_endpoint_by(alias_sym)
      @web_service_endpoints_by_alias[alias_sym]
    end

    def env_options
      {}.tap do |hash|
        ENV.each do |key, value|
          match = key.match(/APP_STORE_CONNECT_(?<name>[A-Z_]+)/)

          next unless match

          hash[match[:name].downcase.to_sym] = value
        end
      end
    end

    def options(**kwargs)
      defaults = {
        analytics_enabled: true
      }
      AppStoreConnect.config.merge(kwargs.merge(env_options.merge(defaults))).tap do |options|
        %i[key_id issuer_id private_key].each do |key|
          raise ArgumentError, "missing #{key}" unless options.keys.include?(key)
        end
      end
    end

    def http_body(web_service_endpoint, **kwargs)
      schema = SCHEMA.object!(type: web_service_endpoint.http_body_type)
      object = Object.new(**schema.options, kwargs: kwargs)

      object
        .to_h
        .deep_transform_keys { |k| k.to_s.camelize(:lower) }
        .to_json
    end

    def build_request(web_service_endpoint, **kwargs)
      options = {
        kwargs: kwargs,
        web_service_endpoint: web_service_endpoint,
        http_method: web_service_endpoint.http_method,
        uri: build_uri(web_service_endpoint, **kwargs),
        headers: headers
      }

      options[:http_body] = http_body(web_service_endpoint, **kwargs) if web_service_endpoint.http_method == :post

      Request.new(options)
    end

    def headers
      {
        'Authorization' => "Bearer #{@authorization.token}",
        'Content-Type' => 'application/json'
      }
    end
  end
end
