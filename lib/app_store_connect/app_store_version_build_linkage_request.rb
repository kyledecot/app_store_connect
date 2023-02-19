# frozen_string_literal: true

module AppStoreConnect
  class AppStoreVersionBuildLinkageRequest < Request::Body::Create
    data do
      id :build_id
      type 'builds'
    end
  end
end
