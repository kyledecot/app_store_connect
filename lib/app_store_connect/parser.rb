# frozen_string_literal: true

module AppStoreConnect
  class Parser
    def self.parse!(schema)
      parse_types(schema.types)
    end

    def self.parse_types(types)
      types.each do |name, schema|
        klass = Factory.build(schema.type, schema.options)

        AppStoreConnect::Type.const_set(name, klass)
      end
    end
    private_class_method :parse_types
  end
end
