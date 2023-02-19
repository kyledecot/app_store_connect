# frozen_string_literal: true

module AppStoreConnect
  class AppStoreVersionPhasedReleaseCreateRequest < Request::Body
    data do
      type 'appStoreVersionPhasedReleases'

      attributes do
        property :phased_release_state
      end
    end
  end
end
