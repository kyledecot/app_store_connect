# frozen_string_literal: true

module AppStoreConnect
  class ProfileCreateRequest < CreateRequest
    data do
      type 'profiles'

      attributes do
        property :name, required: true
        property :profile_type, required: true
      end
    end
  end
end
