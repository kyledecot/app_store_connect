# frozen_string_literal: true

require 'app_store_connect/schema/type'
require 'app_store_connect/schema/object'
require 'app_store_connect/schema/web_service_endpoint'

module AppStoreConnect
  class Schema
    attr_reader :types, :web_service_endpoints, :objects

    def initialize(path)
      schema = JSON.parse(File.read(path)).deep_symbolize_keys
      @types = schema[:types].map do |options|
        Type.new(options)
      end
      @web_service_endpoints = schema[:web_service_endpoints].map do |options|
        WebServiceEndpoint.new(options)
      end
      @objects = schema[:objects].map do |options|
        Object.new(options)
      end
    end
  end
end
