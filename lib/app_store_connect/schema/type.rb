# frozen_string_literal: true

module AppStoreConnect
  class Schema
    class Type
      attr_reader :type, :options, :values

      def initialize(options)
        @type = options[:type]
        @values = options[:values]
        @options = options
      end
    end
  end
end
