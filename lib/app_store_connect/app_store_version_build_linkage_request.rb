# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  class AppStoreVersionBuildLinkageRequest < CreateRequest
    data do
      type 'builds'

      attributes do
        property :id, required: true
      end
    end
  end
end
