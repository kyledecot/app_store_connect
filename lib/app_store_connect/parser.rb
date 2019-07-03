# frozen_string_literal: true

module AppStoreConnect
  class Parser
    def self.parse!
      json = JSON.parse(File.read(File.join(__dir__, '../config/api.json')))

      parse_types(json['Type'])
    end

    def self.parse_types(types)
      types.each do |name, type|
        klass = Factory.type(type.deep_symbolize_keys)

        AppStoreConnect::Type.const_set(name, klass)
      end
    end
  end
end
