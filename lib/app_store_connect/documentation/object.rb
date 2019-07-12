# frozen_string_literal: true

require 'terminal-table'
require 'colorize'

require 'app_store_connect/documentation/object/parameter'

module AppStoreConnect
  class Documentation
    class Object
      def initialize(page:)
        @page = page
      end

      def name
        @name ||= @page.at('.topic-heading').text
      end

      def to_specification
        @to_specification ||= begin
          property_specifications = properties.map do |property|
            property_specification_options = {}.tap do |hash|
              hash['object'] = property.type
            end

            [property.name, property_specification_options]
          end.to_h

          ObjectSpecification.new(
            name: name,
            options: {
              'Properties' => property_specifications
            }
          )
        end
      end

      def to_terminal_table
        @to_terminal_table ||= begin
          Terminal::Table.new do |table|
            table.title = "Object\n#{name.green}"
            table.headings = %w[name type required array]
            table.rows = properties.map do |parameter|
              [
                parameter.name,
                parameter.type,
                parameter.required?,
                parameter.array?
              ]
            end
          end
        end
      end

      def properties
        @properties ||= begin
          @page.search('.parametertable-row').map do |element|
            Parameter.new(element: element)
          end
        end
      end
    end
  end
end
