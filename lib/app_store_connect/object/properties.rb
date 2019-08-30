# frozen_string_literal: true

require 'delegate'

module AppStoreConnect
  class Object
    class Properties < SimpleDelegator
      def initialize(**options)
        @options = options
        super(options.map do |name, sub_options|
          schema = SCHEMA.object!(type: sub_options[:type])

          [name, Object.new(**schema.options)]
        end.to_h)
      end

      def names(recursive = false)
        return keys unless recursive

        keys + values.flat_map { |p| p.property_names(recursive) }
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
