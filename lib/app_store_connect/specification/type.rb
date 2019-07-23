# frozen_string_literal: true

module AppStoreConnect
  class Specification
    class Type
      TYPE = :type

      attr_reader :name, :options

      def initialize(name:, options: {})
        @name = name
        @options = options
      end

      def specifications
        [] # TODO
      end

      def ==(other)
        name == other.name
      end

      alias eql? ==

      def properties
        {}
      end

      def to_h
        {}
      end

      def related_type_names_by_type
        {}
      end

      def hash
        name.hash
      end
    end
  end
end
