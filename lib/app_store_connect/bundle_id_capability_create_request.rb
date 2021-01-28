# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  class BundleIdCapabilityCreateRequest < CreateRequest
    data do
      type 'bundleIdCapabilities'

      attributes do
        property :capability_type, required: true
      end
    end
  end
end
