# frozen_string_literal: true

module AppStoreConnect
  class Factory
    module Builder
      class Type
        def self.call(_specification)
          Class.new(AppStoreConnect::Type) do |base|
            # TODO
          end
        end
      end
    end
  end
end
