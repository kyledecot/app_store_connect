# frozen_string_literal: true

module AppStoreConnect
  class UserInvitationCreateRequest < Request::Body
    data do
      type 'userInvitations'

      attributes do
        property :first_name, required: true
        property :last_name, required: true
        property :email, required: true
        property :roles, required: true
        property :all_apps_visible
        property :provisioning_allowed
      end
    end
  end
end
