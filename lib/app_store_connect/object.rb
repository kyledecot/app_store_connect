# frozen_string_literal: true

module AppStoreConnect
  class Object
    def self.properties
      @properties ||= {}
    end

    def self.property(name, options)
      properties[name] = options
      attr_reader name
    end

    def self.property_names
      properties.keys
    end

    def initialize(**args)
      self.class.properties.each do |name, options|
        value = if options['object']
                  "AppStoreConnect::#{options['object'].gsub('.', '::')}".constantize.new(**args)
                else
                  options['value'] || args[name.to_sym]
                end
        instance_variable_set("@#{name}", value)
      end
    end

    def to_h
      {}.tap do |hash|
        properties.each do |name, options|
          value = if options['object']
                    instance_variable_get("@#{name.underscore}").to_h
                  else
                    instance_variable_get("@#{name.underscore}")
                  end

          hash[name.underscore.to_sym] = options['array'] ? [*value] : value
        end
      end
    end
  end
end
