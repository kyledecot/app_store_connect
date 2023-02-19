# frozen_string_literal: true

module AppStoreConnect
  class AppStoreVersionReleaseRequestCreateRequest < Request::Body::Create
    data do
      type 'appStoreVersionReleaseRequests'
    end
  end
end
