# frozen_string_literal: true

require 'active_support/all'

require 'app_store_connect/web_service_endpoint'
require 'app_store_connect/request'

module AppStoreConnect
  class Client
    def initialize(**kwargs)
      @options = options(**kwargs)

      @authorization = Authorization.new(
        private_key: @options[:private_key],
        key_id: @options[:key_id],
        issuer_id: @options[:issuer_id]
      )
      @web_service_endpoints_by_name ||= begin
        AppStoreConnect::Config::API['web_service_endpoints'].dup.map do |config|
          [config.fetch('alias').to_sym, WebServiceEndpoint.new(**config.deep_symbolize_keys)]
        end.to_h
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      web_service_endpoint_names.include?(method_name) || super
    end

    def method_missing(method_name, *kwargs)
      super unless web_service_endpoint_names.include?(method_name)

      web_service_endpoint = web_service_endpoint_by(name: method_name)

      call(web_service_endpoint, *kwargs)
    end

    private

    def web_service_endpoint_names
      @web_service_endpoints_by_name.keys
    end

    def call(web_service_endpoint, **kwargs)
      parser = proc do |response|
        JSON.parse(response.body)
      end

      case web_service_endpoint.http_method
      when :get
        get(web_service_endpoint, **kwargs, &parser)
      when :post
        post(web_service_endpoint, **kwargs, &parser)
      else
        raise "invalid http method: #{web_service_endpoint.http_method}"
      end
    end

    def build_uri(web_service_endpoint, **kwargs)
      URI(web_service_endpoint
        .url
        .gsub(/(\{(\w+)\})/) { kwargs.fetch(Regexp.last_match(2).to_sym) })
    end

    def web_service_endpoint_by(name:)
      @web_service_endpoints_by_name[name]
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
      AppStoreConnect.config.merge(kwargs.merge(env_options)).tap do |options|
        %i[key_id issuer_id private_key].each do |key|
          raise ArgumentError, "missing #{key}" unless options.keys.include?(key)
        end
      end
    end

    def get(web_service_endpoint, **kwargs, &block)
      request = Request.new(
        kwargs: kwargs,
        web_service_endpoint: web_service_endpoint,
        http_method: :get,
        uri: build_uri(web_service_endpoint, **kwargs),
        headers: headers
      )

      request.execute(&block)
    end

    def http_body(web_service_endpoint, **kwargs)
      "AppStoreConnect::#{web_service_endpoint.http_body_type}"
        .constantize
        .new(**kwargs)
        .to_json
    end

    def post(web_service_endpoint, **kwargs, &block)
      Request.new(
        web_service_endpoint: web_service_endpoint,
        kwargs: kwargs,
        http_method: :post,
        uri: build_uri(web_service_endpoint, **kwargs),
        headers: headers,
        http_body: http_body(web_service_endpoint, **kwargs)
      )

      request.execute(&block)
    end

    def headers
      {
        'Authorization' => "Bearer #{@authorization.token}",
        'Content-Type' => 'application/json'
      }
    end
  end
end
