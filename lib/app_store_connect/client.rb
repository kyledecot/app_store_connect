# frozen_string_literal: true

require 'active_support/all'

require 'app_store_connect/request'
require 'app_store_connect/schema'
require 'app_store_connect/client/authorization'
require 'app_store_connect/client/options'
require 'app_store_connect/client/usage'
require 'app_store_connect/client/registry'
require 'app_store_connect/client/utils'

module AppStoreConnect
  class Client
    def initialize(**kwargs)
      @options = Options.new(kwargs)
      @usage = Usage.new(@options.slice(*Usage::OPTIONS))
      @authorization = Authorization.new(@options.slice(*Authorization::OPTIONS))
      @registry = Registry.new(@options.slice(*Registry::OPTIONS))
    end

    def respond_to_missing?(method_name, include_private = false)
      web_service_endpoint_aliases.include?(method_name) || super
    end

    def method_missing(method_name, **kwargs)
      super unless web_service_endpoint_aliases.include?(method_name)

      web_service_endpoint = web_service_endpoint_by(method_name)

      call(web_service_endpoint, **kwargs)
    end

    # :nocov:
    def inspect
      "#<#{self.class.name}:#{object_id}>"
    end
    # :nocov:

    def web_service_endpoint_aliases
      @registry.keys
    end

    private

    def call(web_service_endpoint, **kwargs)
      raise "invalid http method: #{web_service_endpoint.http_method}" unless %i[get delete post patch].include?(web_service_endpoint.http_method)

      request = build_request(web_service_endpoint, **kwargs)

      @usage.track
      response = request.execute

      Utils.decode(response.body, response.content_type) if response.body
    end

    def build_uri(web_service_endpoint, **kwargs)
      URI(web_service_endpoint
        .url
        .gsub(/(\{(\w+)\})/) { kwargs.fetch(Regexp.last_match(2).to_sym) })
    end

    def web_service_endpoint_by(alias_sym)
      @registry[alias_sym]
    end

    def http_body(web_service_endpoint, **kwargs)
      Utils.encode("AppStoreConnect::#{web_service_endpoint.http_body_type}"
        .constantize
        .new(**kwargs)
        .to_h)
    end

    def build_request(web_service_endpoint, **kwargs)
      options = {
        kwargs: kwargs,
        web_service_endpoint: web_service_endpoint,
        http_method: web_service_endpoint.http_method,
        uri: build_uri(web_service_endpoint, **kwargs),
        headers: headers
      }

      options[:http_body] = http_body(web_service_endpoint, **kwargs) if %i[post patch].include?(web_service_endpoint.http_method)

      Request.new(**options)
    end

    def headers
      {
        'Authorization' => "Bearer #{@authorization.token}",
        'Content-Type' => 'application/json'
      }
    end
  end
end
