# frozen_string_literal: true

module AppStoreConnect
  module Specification
    class Object
      TYPE = :object

      attr_reader :name, :options

      def initialize(name:, options: {})
        @name = name
        @options = options
      end

      # TODO: This doesn't return specifications but rather object names
      def specifications
        properties.values.map { |p| p['object'] }
      end

      def ==(other)
        name == other.name
      end

      def related_type_names_by_type
        {
          object: properties.values.map { |p| p['object'] }.compact
        }
      end

      alias eql? ==

      def properties
        options['Properties'] || options[:properties] # TODO
      end

      def hash
        name.hash
      end
    end
  end
end
