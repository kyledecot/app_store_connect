# frozen_string_literal: true

module AppStoreConnect
  module Specification
    class Type
      attr_reader :name, :options

      def initialize(name:, options: {})
        @name = name
        @options = options
      end

      def type
        :type
      end

      def ==(other)
        name == other.name
      end

      alias eql? ==

      def properties
        {}
      end

      def hash
        name.hash
      end
    end
  end
end
