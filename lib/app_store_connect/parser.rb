# frozen_string_literal: true

module AppStoreConnect
  class Parser
    def self.parse!(schema)
      schema.types.each do |type_schema|
        options = type_schema.options
        klass = Factory.build('enum', type_schema.options) # TODO
        name = options[:type]

        AppStoreConnect::Type.const_set(name, klass)
      end
    end
  end
end
