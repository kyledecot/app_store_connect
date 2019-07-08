# frozen_string_literal: true

module AppStoreConnect
  module Object
    module Properties
      module ClassMethods
        def properties
          @properties ||= {}
        end

        def property(name, options = {})
          properties[name] = options

          attr_accessor name.to_sym
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
