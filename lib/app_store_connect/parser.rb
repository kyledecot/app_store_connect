# frozen_string_literal: true

module AppStoreConnect
  class Parser
    def self.parse!(config)
      parse_types(config['Type'])
    end

    def self.parse_types(types)
      types.each do |name, type|
        klass = Factory.type(type.deep_symbolize_keys)

        AppStoreConnect::Type.const_set(name, klass)
      end
    end
    private_class_method :parse_types
  end
end
