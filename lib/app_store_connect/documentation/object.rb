# frozen_string_literal: true

require 'terminal-table'
require 'colorize'

require 'app_store_connect/documentation/object/parameter'

module AppStoreConnect
  module Documentation
    class Object
      def initialize(page:)
        @page = page
      end

      def name
        @page.at('.topic-heading').text
      end

      def to_terminal_table
        Terminal::Table.new do |table|
          table.title = "Object\n#{name.green}"
          table.headings = %w[name type required array]
          table.rows = parameters.map do |parameter|
            [
              parameter.name,
              parameter.type,
              parameter.required?,
              parameter.array?
            ]
          end
        end
      end

      def parameters
        @parameters ||= begin
          @page.search('.parametertable-row').map do |element|
            Parameter.new(element: element)
          end
        end
      end
    end
  end
end
