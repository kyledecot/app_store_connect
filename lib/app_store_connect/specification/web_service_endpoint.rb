# frozen_string_literal: true

module AppStoreConnect
  module Specification
    TYPE = :web_service_endpoint

    class WebServiceEndpoint
      def initialize(options:)
        @options = options
      end
    end
  end
end
