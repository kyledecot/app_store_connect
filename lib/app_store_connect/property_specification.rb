# frozen_string_literal: true

module AppStoreConnect
  class Object
    class PropertySpecification
      attr_reader :name, :options

      def initialize(name, options = {})
        @name = name
        @options = options
      end

      def ==(other)
        name == other.name
      end

      alias eql? ==

      def hash
        name.hash
      end

      def array?
        options['array']
      end

      def object?
        options.key?('object')
      end

      def plain(rich)
        value = if object?
                  if array?
                    rich.map(&:to_h)
                  else
                    rich.to_h
                  end
                else
                  rich
        end
        array? ? [*value] : value
      end

      def rich(**plain)
        if object?
          if array?
            [*plain[name]].map do |sub|
              "AppStoreConnect::#{options['object'].gsub('.', '::')}".constantize.new(**sub)
            end
          else
            "AppStoreConnect::#{options['object'].gsub('.', '::')}".constantize.new(**plain)
          end
        else
          options['value'] || plain[name.to_sym]
        end
      end
    end
  end
end
