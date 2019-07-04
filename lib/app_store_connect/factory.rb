# frozen_string_literal: true

module AppStoreConnect
  class Factory
    BuilderNotRegistered = Class.new(StandardError)

    def self.register(name, builder)
      builders[name] = builder
    end

    def self.builders
      @builders ||= {}
    end

    def self.build(name, options = {})
      builder = builders[name]

      raise BuilderNotRegistered, "Builder not registered: #{name}" if builder.nil?

      builder.call(options)
    end
  end
end
