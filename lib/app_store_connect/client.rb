# frozen_string_literal: true

require 'active_support/all'

require 'app_store_connect/web_service_endpoint'

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

    def web_service_endpoint_names
      @web_service_endpoints_by_name.keys
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

    def call(web_service_endpoint, **kwargs)
      case web_service_endpoint.http_method
      when :get
        get(web_service_endpoint, **kwargs)
      when :post
        post(web_service_endpoint, **kwargs)
      else
        raise "invalid http method: #{web_service_endpoint.http_method}"
      end
    end

    def build_url(web_service_endpoint, **kwargs)
      web_service_endpoint
        .url
        .gsub(/(\{(\w+)\})/) { kwargs.fetch(Regexp.last_match(2).to_sym) }
    end

    def url_parameter_names(web_service_endpoint)
      web_service_endpoint
        .url
        .scan(/(\{(\w+)\})/)
        .map { |_, n| n.to_sym }
    end

    def web_service_endpoint_by(name:)
      @web_service_endpoints_by_name[name]
    end

    def options(**kwargs)
      AppStoreConnect.config.merge(kwargs).tap do |options|
        %i[key_id issuer_id private_key].each do |key|
          raise ArgumentError, "missing #{key}" unless options.keys.include?(key)
        end
      end
    end

    def build_body(request)
      request
        .to_hash
        .deep_transform_keys { |k| k.to_s.camelize(:lower) }
        .to_json
    end

    def build_query(web_service_endpoint, **kwargs)
      query_parameters = kwargs.dup.tap do |hash|
        url_parameter_names(web_service_endpoint).each do |name|
          hash.delete(name.to_sym)
        end
      end

      query_parameters.to_query
    end

    def get(web_service_endpoint, **kwargs)
      url = build_url(web_service_endpoint, **kwargs)
      query = build_query(web_service_endpoint, **kwargs)

      response = execute(:get, url, headers: headers, query: query)

      response['data']
    end

    def post(web_service_endpoint, **kwargs)
      url = build_url(web_service_endpoint, **kwargs)
      request = "AppStoreConnect::#{web_service_endpoint.http_body_type}".constantize.new(**kwargs)
      body = build_body(request)

      response = execute(:post, url, headers: headers, body: body)

      response
    end

    def execute(http_method, url, **options)
      HTTParty.send(http_method, url, options)
    end

    def headers
      {
        'Authorization' => "Bearer #{@authorization.token}",
        'Content-Type' => 'application/json'
      }
    end
  end
end
