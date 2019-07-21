# frozen_string_literal: true

require 'securerandom'

module AppStoreConnect
  module Specification
    class WebServiceEndpoint
      TYPE = :web_service_endpoint

      def name
        "web-service-endpoint-#{SecureRandom.hex}"
      end

      def related_type_names_by_type
        {}
      end

      def to_h
        {}
      end

      def initialize(options:)
        @options = options
      end
    end
  end
end
