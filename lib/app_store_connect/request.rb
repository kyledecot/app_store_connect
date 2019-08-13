# frozen_string_literal: true

require 'net/http'

module AppStoreConnect
  class Request
    def initialize(**options)
      @options = options
    end

    def execute
      response = Net::HTTP.start(uri.host, uri.port, net_http_options) do |http|
        http.request(request)
      end

      JSON.parse(response.body)
    end

    private

    def http_method
      @options.fetch(:http_method).to_sym
    end

    def net_http_options
      { use_ssl: uri.scheme == 'https' }
    end

    def query
      return unless http_method == :get
      return unless @options[:query]

      @options[:query]
    end

    def uri
      URI(@options.fetch(:url)).tap do |uri|
        uri.query = query
      end
    end

    def headers
      @options.fetch(:headers, {})
    end

    def request
      case http_method
      when :get
        Net::HTTP::Get.new(uri).tap do |request|
          headers.each do |key, value|
            request[key] = value
          end
        end
      when :post
        Net::HTTP::Post.new(uri, headers)
      else
        raise "unsupported http method: #{http_method}"
      end
    end
  end
end
