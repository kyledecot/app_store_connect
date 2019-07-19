# frozen_string_literal: true

require 'terminal-table'
require 'colorize'

module AppStoreConnect
  class Documentation
    class Type
      TYPE = :type

      def initialize(page:)
        @page = page
      end

      def name
        type # TODO
      end

      def type
        @page.at('.topic-heading').text
      end

      def possible_values
        [] # TODO
      end

      def to_specification
        Specification::Type.new(name: type)
      end

      def to_terminal_table
        Terminal::Table.new do |table|
          table.title = "Type\n#{name.yellow}"
          table.headings = ['type', 'possible values']
          table.rows = []
        end
      end
    end
  end
end
