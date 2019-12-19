# frozen_string_literal: true

require 'delegate'
require 'app_store_connect/schema/object/property'

module AppStoreConnect
  class Schema
    class Object
      class Properties < SimpleDelegator
        def initialize(properties_by_name = [])
          super(properties_by_name.map do |name, attributes|
            [name, Property.new(attributes)]
          end.to_h)
        end
      end
    end
  end
end
