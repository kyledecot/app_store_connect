# frozen_string_literal: true

module AppStoreConnect
  class Factory
    def self.type(schema)
      Class.new(Type::Enum) do |base|
        base.const_set('VALUES', schema.values)
      end
    end
  end
end
