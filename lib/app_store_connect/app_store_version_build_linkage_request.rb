# frozen_string_literal: true

module AppStoreConnect
  class AppStoreVersionBuildLinkageRequest < Request::Body
    data do
      id :build_id
      type 'builds'
    end
  end
end
