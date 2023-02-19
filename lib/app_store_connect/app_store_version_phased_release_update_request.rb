# frozen_string_literal: true

module AppStoreConnect
  class AppStoreVersionPhasedReleaseUpdateRequest < Request::Body::Update
    data do
      id
      type 'appStoreVersionPhasedReleases'

      attributes do
        property :phased_release_state
      end
    end
  end
end
