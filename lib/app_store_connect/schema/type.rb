# frozen_string_literal: true

module AppStoreConnect
  class Schema
    class Type
      attr_reader :type, :options

      def initialize(**options)
        @type = options.delete(:type)
        @options = options
      end
    end
  end
end
