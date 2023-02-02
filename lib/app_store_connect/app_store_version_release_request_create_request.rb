# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  class AppStoreVersionReleaseRequestCreateRequest < CreateRequest
    data do
      type 'appStoreVersionReleaseRequests'
    end
  end
end
