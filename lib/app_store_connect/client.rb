# frozen_string_literal: true

require 'active_support/all'

require 'app_store_connect/request'
require 'app_store_connect/authorization'
require 'app_store_connect/schema'
require 'app_store_connect/client/usage'

module AppStoreConnect
  class Client
    def initialize(**kwargs)
      @options = options(**kwargs)

      @authorization = Authorization.new(
        private_key: @options[:private_key],
        key_id: @options[:key_id],
        issuer_id: @options[:issuer_id]
      )
      @web_service_endpoints_by_alias ||= @options
                                          .fetch(:schema)
                                          .web_service_endpoints
                                          .map { |s| [s.alias, s] }
                                          .to_h
      @usage = Usage.new
    end

    def respond_to_missing?(method_name, include_private = false)
      web_service_endpoint_aliases.include?(method_name) || super
    end

    def method_missing(method_name, *kwargs)
      super unless web_service_endpoint_aliases.include?(method_name)

      web_service_endpoint = web_service_endpoint_by(method_name)

      call(web_service_endpoint, *kwargs)
    end

    def inspect
      "#<#{self.class.name}:#{object_id}>"
    end

    def web_service_endpoint_aliases
      @web_service_endpoints_by_alias.keys
    end

    private

    def call(web_service_endpoint, **kwargs)
      raise "invalid http method: #{web_service_endpoint.http_method}" unless %i[get delete post].include?(web_service_endpoint.http_method)

      request = build_request(web_service_endpoint, **kwargs)

      @usage.track if @options[:analytics_enabled]
      response = request.execute

      JSON.parse(response.body) if response.body
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
        analytics_enabled: true,
        schema: Schema.new(File.join(__dir__, '../config/schema.json'))
      }
      AppStoreConnect.config.merge(kwargs.merge(env_options.merge(defaults))).tap do |options|
        %i[key_id issuer_id private_key].each do |key|
          raise ArgumentError, "missing #{key}" unless options.keys.include?(key)
        end
      end
    end

    def http_body(web_service_endpoint, **kwargs)
      "AppStoreConnect::#{web_service_endpoint.http_body_type}"
        .constantize
        .new(**kwargs)
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
