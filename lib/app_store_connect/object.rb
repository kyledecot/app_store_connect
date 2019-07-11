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
                  if options['array']
                    [*args[name]].map do |sub|
                      "AppStoreConnect::#{options['object'].gsub('.', '::')}".constantize.new(**sub)
                    end
                  else
                    "AppStoreConnect::#{options['object'].gsub('.', '::')}".constantize.new(**args)
                  end
                else
                  options['value'] || args[name.to_sym]
                end
        instance_variable_set("@#{name}", value)
      end
    end

    def to_h
      {}.tap do |hash|
        self.class.properties.each do |name, options|
          hash[name] = property_to_h(name, options)
        end
      end
    end

    private

    def property_to_h(name, options)
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
