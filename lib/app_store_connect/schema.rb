# frozen_string_literal: true

require 'app_store_connect/schema/web_service_endpoint'
require 'app_store_connect/schema/object'

module AppStoreConnect
  class Schema
    attr_reader :web_service_endpoints, :objects

    def initialize(path)
      @schema = JSON.parse(File.read(path)).deep_symbolize_keys
      @web_service_endpoints = []
      @objects = []
    end

    def load!
      @schema[:objects].each do |s|
        @objects << Object.new(**s)
      end

      @web_service_endpoints = @schema[:web_service_endpoints].map do |s|
        WebServiceEndpoint.new(**s)
      end
    end

    def object!(type:)
      object = @objects.detect { |o| o.type == type }

      raise "Unable to find object schema for: #{type}.\n\nRegistered objects are: #{@objects.map(&:type).join("\n")}" if object.nil?

      object
    end
  end
end
