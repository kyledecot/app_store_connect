# frozen_string_literal: true

module AppStoreConnect
  class Factory
    module Builder
      class Object
        def self.call(specification)
          Class.new(AppStoreConnect::Object) do |base|
            specification.properties.each do |name, options|
              base.property name.underscore.to_sym, options
            end
          end
        end
      end
    end
  end
end
