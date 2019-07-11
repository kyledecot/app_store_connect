# frozen_string_literal: true

require 'active_support/concern'
require 'active_support/core_ext/class/attribute_accessors'

module AppStoreConnect
  class Object
    module Properties
      extend ActiveSupport::Concern

      included do
        def property_specifications
          self.class.property_specifications
        end

        def properties
          @properties ||= {}
        end
      end

      class_methods do
        def property_specifications
          @property_specifications ||= []
        end

        def property(name, options)
          property_specifications << PropertySpecification.new(name, options)

          define_method name do
            @properties[name]
          end
        end

        def property_names
          property_specifications.map(&:name)
        end
      end
    end
  end
end
