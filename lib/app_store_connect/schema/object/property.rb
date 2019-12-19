# frozen_string_literal: true

require 'delegate'

module AppStoreConnect
  class Schema
    class Object
      class Property < SimpleDelegator
        UnsupportedType = Class.new(ArgumentError)

        def initialize(attributes = {})
          super(attributes)
        end

        def required?
          fetch(:required, false)
        end

        def type
          case fetch(:type)
          when 'uri-reference' then URI
          else
            raise UnsupportedType, fetch(:type)
          end
        end
      end
    end
  end
end
