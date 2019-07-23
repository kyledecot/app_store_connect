# frozen_string_literal: true

require 'securerandom'

module AppStoreConnect
  class Specification
    class WebServiceEndpoint
      TYPE = :web_service_endpoint

      def name
        "web-service-endpoint-#{SecureRandom.hex}"
      end

      def related_type_names_by_type
        {}
      end

      def to_h
        {
          http_method: @options[:http_method],
          description: @options[:description],
          type: 'Web Service Endpoint',
          name: name,
          host: @options[:host],
          path: @options[:path]
        }
      end

      def initialize(options:)
        @options = options
      end
    end
  end
end
