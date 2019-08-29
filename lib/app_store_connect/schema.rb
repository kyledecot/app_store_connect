# frozen_string_literal: true

require 'app_store_connect/schema/web_service_endpoint'
require 'app_store_connect/schema/object'

module AppStoreConnect
  class Schema
    attr_reader :web_service_endpoints, :objects

    def initialize(path)
      schema = JSON.parse(File.read(path)).deep_symbolize_keys
      @web_service_endpoints = schema[:web_service_endpoints].map do |s|
        WebServiceEndpoint.new(**s)
      end
      @objects = schema[:objects].map do |s|
        Object.new(**s)
      end
    end

    def object!(type:)
      object = @objects.detect { |o| o.type == type }

      raise "Unable to find object schema for: #{type}" if object.nil?

      object
    end
  end
end
