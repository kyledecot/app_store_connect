# frozen_string_literal: true

require_relative './bundle_id_create_request/data'

module AppStoreConnect
  class BundleIdCreateRequest
    attr_reader :data

    def initialize(*args)
      @data = Data.new(*args)
    end

    def to_h
      {
        data: data.to_h
      }
    end
  end
end
