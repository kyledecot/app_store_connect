# frozen_string_literal: true

module AppStoreConnect
  module Specification
    class WebServiceEndpoint
      TYPE = :web_service_endpoint

      def related_type_names_by_type
        {}
      end

      def initialize(options:)
        @options = options
      end
    end
  end
end
