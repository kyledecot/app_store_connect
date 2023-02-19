# frozen_string_literal: true

module AppStoreConnect
  class DeviceCreateRequest < Request::Body::Create
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
