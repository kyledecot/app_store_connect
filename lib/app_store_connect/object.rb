# frozen_string_literal: true

module AppStoreConnect
  class Object
    def self.properties
      @properties ||= []
    end

    def self.property(name, options)
      properties << Property.new(name, options)
      attr_reader name
    end

    def self.property_names
      properties.map(&:name)
    end

    def initialize(**args)
      self.class.properties.each do |property|
        value = if property.options['object']
                  if property.options['array']
                    [*args[property.name]].map do |sub|
                      "AppStoreConnect::#{property.options['object'].gsub('.', '::')}".constantize.new(**sub)
                    end
                  else
                    "AppStoreConnect::#{property.options['object'].gsub('.', '::')}".constantize.new(**args)
                  end
                else
                  property.options['value'] || args[property.name.to_sym]
                end
        instance_variable_set("@#{property.name}", value)
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
      options = property.options

      value = if options['object']
                if options['array']
                  instance_variable_get("@#{name}").map(&:to_h)
                else
                  instance_variable_get("@#{name}").to_h
                end
              else
                instance_variable_get("@#{name}")
              end
      options['array'] ? [*value] : value
    end
  end
end
