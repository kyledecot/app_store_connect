# frozen_string_literal: true

module AppStoreConnect
  class Specification
    module Component
      class Schema
        def initialize(declaration)
          @declaration = declaration
        end

        def properties
          @declaration['properties']
        end

        def required
          @declaration['required']
        end

        def title
          @declaration['title']
        end
      end
    end
  end
end
