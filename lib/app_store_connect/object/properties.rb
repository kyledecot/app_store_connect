# frozen_string_literal: true

require 'delegate'

module AppStoreConnect
  class Object
    class Properties < SimpleDelegator
      def initialize(properties: {}, kwargs: {})
        @options = properties
        super(properties.map do |name, sub_options|
          schema = SCHEMA.object!(type: sub_options[:type])

          [name, Object.new(schema: schema)]
        end.to_h)

        kwargs.slice(*names(true)).each do |key, value|
          schema = object_schema_for_property(key)
          self[key] = Object.new(schema: schema, kwargs: value)
        end
      end

      def schemas(recursive = false)
        return values.map(&:schema) unless recursive

        values.map(&:schema) + values.flat_map { |v| v.properties.schemas }
      end

      def object_schema_for_property(name)
        _, property = @options.detect { |k, _| k == name }

        return unless property.present?

        SCHEMA.object!(type: property[:type])
      end

      def names(recursive = false)
        return keys unless recursive

        keys + values.flat_map { |p| p.properties.names(recursive) }
      end

      def to_h
        {}.tap do |hash|
          @options.each do |name, _options|
            hash[name] = self[name].value
          end
        end
      end
    end
  end
end
