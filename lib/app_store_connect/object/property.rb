# frozen_string_literal: true

module AppStoreConnect
  class Object
    class Property
      attr_reader :name, :options

      def initialize(name, options = {})
        @name = name
        @options = options
      end
    end
  end
end
