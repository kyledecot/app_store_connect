# frozen_string_literal: true

require 'net/http'

module AppStoreConnect
  class Request
    class UnsupportedHTTPMethod < ArgumentError
      def initialize(http_method)
        super "Unsupported HTTP Method: #{http_method}"
      end
    end

    def initialize(**options)
      @url = options.fetch(:url)
      @options = options
    end

    def execute
      Net::HTTP.start(uri.host, uri.port, net_http_options) do |http|
        http.request(request)
      end
    end

    private

    def query
      return unless http_method == :get

      names = url_parameter_names(path)

      kwargs
        .reject { |n| names.include?(n) }
        .deep_transform_keys { |k| k.to_s.camelize(:lower) }
        .to_query
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

    def url
      @options.fetch(:url).tap do |url|
        url.query = query if http_method == :get
      end
    end

    def headers
      @options.fetch(:headers, {})
    end

    def body
      return if http_method == :get

      @options.fetch(:http_body)
    end

    def url_parameter_names(path)
      path
        .scan(/(\{(\w+)\})/)
        .map { |_, n| n.to_sym }
    end

    def net_http_request_class
      case http_method
      when :get then Net::HTTP::Get
      when :post then Net::HTTP::Post
      when :delete then Net::HTTP::Delete
      when :patch then Net::HTTP::Patch
      else
        raise UnsupportedHTTPMethod, http_method
      end
    end

    def request
      net_http_request_class
        .new(url, headers)
        .tap { |r| r.body = body if r.request_body_permitted? }
    end
  end
end
