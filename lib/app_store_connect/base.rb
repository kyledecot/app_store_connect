# frozen_string_literal: true

module AppStoreConnect
  class Base
    def initialize(**kwargs)
      @options = Client::Options.new(kwargs)
      @authorization = Client::Authorization.new(@options.slice(*Client::Authorization::OPTIONS))
    end

    # :nocov:
    def inspect
      "#<#{self.class.name}:#{object_id}>"
    end
    # :nocov:

    private

    def call(web_service_endpoint, **kwargs)
      raise "invalid http method: #{web_service_endpoint.http_method}" unless %i[get delete post patch].include?(web_service_endpoint.http_method)

      request = build_request(web_service_endpoint, **kwargs)

      response = request.execute

      Client::Utils.decode(response.body, response.content_type) if response.body
    end

    def build_uri(web_service_endpoint, **kwargs)
      URI(web_service_endpoint
        .url
        .gsub(/(\{(\w+)\})/) { kwargs.fetch(Regexp.last_match(2).to_sym) })
    end

    def http_body(web_service_endpoint, **kwargs)
      Client::Utils.encode("AppStoreConnect::#{web_service_endpoint.http_body_type}"
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
