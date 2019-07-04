# frozen_string_literal: true

module AppStoreConnect
  class Parser
    def self.parse!(config)
      parse_types(config['Type'])
      parse_objects(config['Object'])
    end

    def self.parse_objects(objects)
      objects.each do |name, object|
        klass = Factory.object(object['properties'])

        AppStoreConnect::Object.const_set(name, klass)
      end
    end
    private_class_method :parse_objects

    def self.parse_types(types)
      types.each do |name, type|
        klass = Factory.type(type.deep_symbolize_keys)

        AppStoreConnect::Type.const_set(name, klass)
      end
    end
    private_class_method :parse_types
  end
end
