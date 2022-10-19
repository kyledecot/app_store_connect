# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  class AppStoreVersionPhasedReleaseUpdateRequest < CreateRequest
    data do
      id
      type 'appStoreVersionPhasedReleases'

      attributes do
        property :phased_release_state
      end
    end
  end
end
