# frozen_string_literal: true

require 'forwardable'

require 'app_store_connect/object/properties'

module AppStoreConnect
  class Object
    extend Forwardable

    attr_reader :schema, :properties

    def_delegators :@properties, :[], :[]=

    def initialize(schema:, kwargs: {})
      @schema = schema
      @properties = Properties.new(**schema.options.slice(:properties, :kwargs))
    end

    def method_missing(method_name, *args)
      return self[method_name] if @properties.key?(method_name)

      super
    end

    def respond_to_missing?(method_name, _include_private = false)
      @properties.key?(method_name)
    end

    def value
      to_h
    end

    def to_h
      @properties.to_h
    end
  end
end
