# frozen_string_literal: true

module AppStoreConnect
  class Schema
    attr_reader :options

    class WebServiceEndpoint
      def initialize(**options)
        @options = options
      end

      def alias
        @options.fetch(:alias).to_sym
      end

      def http_method
        @options[:http_method].to_sym
      end

      def http_body_type
        @options[:http_body_type]
      end

      def url
        @options[:url]
      end
    end
  end
end
