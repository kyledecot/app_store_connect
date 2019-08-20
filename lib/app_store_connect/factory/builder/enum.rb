# frozen_string_literal: true

module AppStoreConnect
  class Factory
    module Builder
      class Enum
        def self.call(**_kwargs)
          Class.new(Type::Enum)
        end
      end
    end
  end
end
