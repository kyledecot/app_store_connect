# frozen_string_literal: true

require 'net/http'

module AppStoreConnect
  class Request
    class Get
      def initialize(url, **kwargs)
        @url = url
        @kwargs = kwargs
      end

      def execute
        Net::HTTP.start(url.host, url.port, { use_ssl: true }) do |http|
          http.request(request)
        end
      end

      def request
        Net::HTTP::Get.new(url)
      end
    end
  end
end
