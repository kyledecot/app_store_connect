# frozen_string_literal: true

require 'active_support/core_ext/module/delegation'

module AppStoreConnect
  class ObjectSpecification
    attr_reader :name, :options

    def initialize(name:, options: {})
      @name = name
      @options = options
    end

    def ==(other)
      name == other.name
    end

    alias eql? ==

    def properties
      options['Properties']
    end

    def hash
      name.hash
    end
  end
end
