# frozen_string_literal: true

module AppStoreConnect
  class Schema
    def initialize(path)
      @schema = JSON.parse(File.read(path))
    end

    def types
      @schema['Type']
    end

    def web_service_endpoints
      @schema['web_service_endpoints']
    end
  end
end
