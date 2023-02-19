# frozen_string_literal: true

module AppStoreConnect
  class BundleIdCapabilityCreateRequest < Request::Body::Create
    data do
      type 'bundleIdCapabilities'

      attributes do
        property :capability_type, required: true
      end
    end
  end
end
