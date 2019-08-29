# frozen_string_literal: true

require 'app_store_connect/object/properties'

module AppStoreConnect
  class Object
    attr_reader :properties

    def initialize(**options)
      @properties = Properties.new(**options.delete(:properties))
      @options = options
    end

    def method_missing(method_name, *args)
      return self[method_name] if @properties.key?(method_name)

      super
    end

    def respond_to_missing?(method_name)
      @properties.key?(method_name)
    end

    def []=(key, value)
      @properties[key] = value
    end

    def [](key)
      @properties[key]
    end

    def value
      to_h
    end

    def to_h
      @properties.to_h
    end
  end
end
