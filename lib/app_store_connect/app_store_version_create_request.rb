# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  class AppStoreVersionCreateRequest < CreateRequest
    data do
      type 'appStoreVersions'

      attributes do
        property :platform, required: true
        property :version_string, required: true
      end
    end
  end
end
