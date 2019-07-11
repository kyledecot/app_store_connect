# frozen_string_literal: true

require 'active_support/core_ext/module/delegation'

module AppStoreConnect
  class ObjectSpecification
    attr_reader :name, :properties

    def initialize(name:, properties: {})
      @name = name
      @properties = properties
    end

    def ==(other)
      name == other.name
    end

    alias eql? ==

    def hash
      name.hash
    end
  end
end
