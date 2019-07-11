# frozen_string_literal: true

require 'app_store_connect/object/properties'

module AppStoreConnect
  class Object
    include Properties

    def initialize(**args)
      @properties = {}
      self.class.properties.each do |property|
        value = if property.object?
                  if property.array?
                    [*args[property.name]].map do |sub|
                      "AppStoreConnect::#{property.options['object'].gsub('.', '::')}".constantize.new(**sub)
                    end
                  else
                    "AppStoreConnect::#{property.options['object'].gsub('.', '::')}".constantize.new(**args)
                  end
                else
                  property.options['value'] || args[property.name.to_sym]
                end

        @properties[property.name] = value
      end
    end

    def to_h
      {}.tap do |hash|
        self.class.properties.each do |property|
          hash[property.name] = property_to_h(property)
        end
      end
    end

    private

    def property_to_h(property)
      name = property.name

      value = if property.object?
                if property.array?
                  instance_variable_get("@#{name}").map(&:to_h)
                else
                  instance_variable_get("@#{name}").to_h
                end
              else
                instance_variable_get("@#{name}")
              end
      property.array? ? [*value] : value
    end
  end
end
