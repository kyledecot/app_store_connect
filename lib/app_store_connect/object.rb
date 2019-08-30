# frozen_string_literal: true

require 'forwardable'

require 'app_store_connect/object/properties'

module AppStoreConnect
  class Object
    extend Forwardable

    attr_reader :properties

    def_delegators :@properties, :[], :[]=

    def initialize(**options)
      @properties = Properties.new(**options.delete(:properties))

      @properties.each do |name, property|
        # TODO
      end  

      @options = options
    end

    def property_names(recursive = false)
      @properties.names(recursive)
    end 

    def method_missing(method_name, *args)
      return self[method_name] if @properties.key?(method_name)

      super
    end

    def respond_to_missing?(method_name)
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
