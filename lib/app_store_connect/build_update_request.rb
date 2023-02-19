# frozen_string_literal: true

module AppStoreConnect
  class BuildUpdateRequest < Request::Body::Update
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
