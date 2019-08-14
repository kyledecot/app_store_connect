# frozen_string_literal: true

require 'net/http'

module AppStoreConnect
  attr_reader :uri

  class Request
    def initialize(**options)
      @uri = options.fetch(:uri)
      @options = options
    end

    def execute
      Net::HTTP.start(uri.host, uri.port, net_http_options) do |http|
        response = http.request(request)

        yield response if block_given?
      end
    end

    private

    def web_service_endpoint
      @options.fetch(:web_service_endpoint)
    end

    def query
      return unless http_method == :get

      kwargs.dup.tap do |hash|
        url_parameter_names(web_service_endpoint).each do |name|
          hash.delete(name.to_sym)
        end
      end.to_query
    end

    def http_method
      @options.fetch(:http_method).to_sym
    end

    def net_http_options
      { use_ssl: uri.scheme == 'https' }
    end

    def kwargs
      @options.fetch(:kwargs, {})
    end

    def uri
      @options.fetch(:uri).tap do |uri|
        uri.query = query if http_method == :get
      end
    end

    def headers
      @options.fetch(:headers, {})
    end

    def body
      return if http_method == :get

      @options
        .fetch(:request)
        .to_h
        .deep_transform_keys { |k| k.to_s.camelize(:lower) }
        .to_json
    end

    def url_parameter_names(web_service_endpoint)
      web_service_endpoint
        .url
        .scan(/(\{(\w+)\})/)
        .map { |_, n| n.to_sym }
    end

    def request
      case http_method
      when :get
        Net::HTTP::Get.new(uri, headers)
      when :post
        Net::HTTP::Post.new(uri, headers).tap do |request|
          request.body = body
        end
      else
        raise "unsupported http method: #{http_method}"
      end
    end
  end
end
