# frozen_string_literal: true

module AppStoreConnect
  class Schema
    class Object
      attr_reader :options, :properties

      def initialize(**options)
        @options = options
        @properties = options[:properties]
      end

      def type
        @options.fetch(:type)
      end
    end
  end
end
