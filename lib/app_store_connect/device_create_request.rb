# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  class DeviceCreateRequest < CreateRequest
    data do
      type 'devices'

      attributes do
        property :name, required: true
        property :platform, required: true
        property :udid, required: true
      end
    end
  end
end
