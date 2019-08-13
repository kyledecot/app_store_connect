# frozen_string_literal: true

require 'net/http'

module AppStoreConnect
  class Request
    def initialize(**options)
      @options = options
    end

    def http_method
      @options.fetch(:http_method).to_sym
    end

    def uri
      URI(@options.fetch(:url))
    end

    def execute
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request(request)
      end

      JSON.parse(response.body)
    end

    def request
      case http_method
      when :get
        Net::HTTP::Get.new(uri).tap do |request|
          @options[:headers].each do |key, value|
            request[key] = value
          end
        end
      else
        raise "unsupported http method: #{http_method}"
      end
    end
  end
end
