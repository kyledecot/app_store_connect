# frozen_string_literal: true

require 'app_store_connect/schema/type'

module AppStoreConnect
  class Schema
    def initialize(path)
      @schema = JSON.parse(File.read(path))
    end

    def types
      @schema['Type'].map do |name, options|
        [name, Type.new(**options.deep_symbolize_keys)]
      end.to_h
    end

    def web_service_endpoints
      @schema['web_service_endpoints']
    end
  end
end
