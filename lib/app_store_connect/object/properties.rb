# frozen_string_literal: true

module AppStoreConnect
  class Object
    module Properties
      def self.included(klass)
        klass.extend(ClassMethods)
      end

      module ClassMethods
        def properties
          @properties ||= []
        end

        def property(name, options)
          properties << PropertySpecification.new(name, options)

          define_method name do
            @properties[name]
          end
        end

        def property_names
          properties.map(&:name)
        end
      end

      def properties
        @properties
      end

      def [](property_name)
        properties[property_name]
      end
    end
  end
end
