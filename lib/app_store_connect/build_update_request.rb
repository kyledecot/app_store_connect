# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  class BuildUpdateRequest < CreateRequest
    data do
      id
      type 'builds'

      attributes do
        property :expired
        property :uses_non_exempt_encryption
      end
    end
  end
end
