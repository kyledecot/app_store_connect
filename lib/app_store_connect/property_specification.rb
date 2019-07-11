# frozen_string_literal: true

module AppStoreConnect
  class Object
    class PropertySpecification
      attr_reader :name, :options

      def initialize(name, options = {})
        @name = name
        @options = options
      end

      def ==(other)
        name == other.name
      end

      alias eql? ==

      def hash
        name.hash
      end

      def array?
        options['array']
      end

      def object?
        options.key?('object')
      end
    end
  end
end
