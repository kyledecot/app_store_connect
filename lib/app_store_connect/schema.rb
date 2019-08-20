# frozen_string_literal: true

require 'app_store_connect/schema/type'

module AppStoreConnect
  class Schema
    attr_reader :types, :web_service_endpoints

    def initialize(path)
      schema = JSON.parse(File.read(path)).deep_symbolize_keys
      @types = schema[:types].map do |options|
        Type.new(**options)
      end
      @web_service_endpoints = schema[:web_service_endpoints].map do |s|
        WebServiceEndpoint.new(**s)
      end
    end
  end
end
