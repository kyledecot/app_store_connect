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
        return rich unless object?

        array? ? [*rich.map(&:to_h)] : rich.to_h
      end

      def constantize
        "AppStoreConnect::#{options['object'].gsub('.', '::')}".constantize
      end

      def rich(**kwargs)
        if object?
          if array?
            [*kwargs[name]].map do |sub|
              constantize.new(**sub)
            end
          else
            constantize.new(**kwargs)
          end
        else
          options['value'] || kwargs[name.to_sym]
        end
      end
    end
  end
end
