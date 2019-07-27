# frozen_string_literal: true

require 'terminal-table'
require 'colorize'

module AppStoreConnect
  class Documentation
    class Type
      TYPE = :type

      def self.parsable?(document)
        title = document.css('.topic-title .eyebrow')&.text.to_s

        title == 'Type'
      end

      def initialize(document:)
        @document = document
      end

      def name
        type # TODO
      end

      def self.type
        :type
      end

      def type
        @document.css('.topic-heading').text
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
