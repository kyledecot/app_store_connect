# frozen_string_literal: true

module AppStoreConnect
  class Factory
    module Builder
      class Object
        class Property
          def self.call(_specification)
            Class.new(AppStoreConnect::Object::Property) do |base|
              # TODO
            end
          end
        end
      end
    end
  end
end
