# frozen_string_literal: true

module AppStoreConnect
  class Factory
    class BuilderNotRegistered < StandardError
      def initialize(name)
        super("Builder not registered: #{name}")
      end
    end

    def self.register(name, builder)
      builders[name] = builder
    end

    def self.builders
      @builders ||= {}
    end

    def self.build(name, specification)
      builders.fetch(name) do
        raise BuilderNotRegistered, name
      end.call(specification)
    end
  end
end
