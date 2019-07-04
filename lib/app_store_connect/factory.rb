# frozen_string_literal: true

module AppStoreConnect
  class Factory
    def self.register(name, builder)
      builders[name] = builder
    end

    def self.builders
      @builders ||= {}
    end
    private_class_method :builders

    def self.build(name, options = {})
      builders[name].call(options)
    end
  end
end
