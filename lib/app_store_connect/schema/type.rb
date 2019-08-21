# frozen_string_literal: true

module AppStoreConnect
  class Schema
    class Type
      attr_reader :type, :options

      def initialize(**options)
        @type = options[:type]
        @options = options
      end

      def values
        @options[:values]
      end
    end
  end
end
