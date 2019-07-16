# frozen_string_literal: true

module AppStoreConnect
  class Documentation
    class Object
      class Property
        TYPE = :object_property

        def initialize(element:)
          @element = element
        end

        def name
          @element.at('.parametertable-name').text.gsub(/(\[|\])/, '')
        end

        def type
          @element.at('.parametertable-type').text.chomp("\n").gsub(/(\[|\])/, '')
        end

        def array?
          !@element.at('.parametertable-type').text.match(/\[.+\]/).nil?
        end

        def required?
          @element
            .at('.parametertable-requirement')
            &.text
            &.match?(/Required/)
        end
      end
    end
  end
end
