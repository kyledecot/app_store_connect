# frozen_string_literal: true

require 'delegate'

module AppStoreConnect
  class Object 
    class Properties < SimpleDelegator
      def initialize(**options)
        @options = options
        @object_schemas_by_name = {}
        super(options.map do |name, sub_options|
          @object_schemas_by_name[name] = SCHEMA.object!(
            type: sub_options[:type]
          )

          [name, Object.new(**@object_schemas_by_name[name].options)]
        end.to_h)
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
