# frozen_string_literal: true

module AppStoreConnect
  class Factory
    module Builder
      class Enum
        def self.call(values:)
          Class.new(Type::Enum) do |base|
            base.const_set('VALUES', values)
          end
        end
      end
    end
  end
end
