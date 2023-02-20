# frozen_string_literal: true

require 'net/http'

module AppStoreConnect
  class Request
    class Post
      def initialize(url, body, **kwargs)
        @url = url
        @body = body
        @kwargs = kwargs
      end

      def execute(headers)
        Net::HTTP.start(@url.host, @url.port, { use_ssl: true }) do |http|
          Response::Post.new(http.request(request(headers)))
        end
      end

      def request(headers)
        Net::HTTP::Post.new(@url.to_s, headers).tap do |r|
          r.body = @body.to_json
        end
      end
    end
  end
end
