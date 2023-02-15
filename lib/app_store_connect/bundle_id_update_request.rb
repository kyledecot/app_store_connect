# frozen_string_literal: true

require 'app_store_connect/modify_request'

module AppStoreConnect
  class BundleIdUpdateRequest < ModifyRequest
    data do
      id

      type 'bundleIds'

      attributes do
        property :name
      end
    end
  end
end
