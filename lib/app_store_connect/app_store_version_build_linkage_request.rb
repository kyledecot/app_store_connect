# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  class AppStoreVersionBuildLinkageRequest < CreateRequest
    data do
      id :build_id
      type 'builds'
    end
  end
end
