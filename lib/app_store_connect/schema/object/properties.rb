# frozen_string_literal: true

require 'delegate'
require 'pry'

module AppStoreConnect
  class Schema
    class Object
      class Properties < SimpleDelegator
        def initialize(properties = {})
          super(properties.to_h.map do |key, options|
            [key, SCHEMA.object!(type: options[:type])]
          end.to_h)
        end

        def schemas(recursive = false)
          return values unless recursive

          values + values.flat_map { |v| v.properties.schemas(recursive) }
        end
      end
    end
  end
end
