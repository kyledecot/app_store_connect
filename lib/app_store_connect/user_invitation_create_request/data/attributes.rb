# frozen_string_literal: true

module AppStoreConnect
  class UserInvitationCreateRequest
    class Data
      class Attributes
        attr_reader :all_apps_visible, :email, :first_name, :last_name, :provisioning_allowed, :roles

        def initialize(all_apps_visible: true, email:, first_name:, last_name:, provisioning_allowed: true, roles:)
          @all_apps_visible = all_apps_visible
          @email = email
          @first_name = first_name
          @last_name = last_name
          @provisioning_allowed = provisioning_allowed
          @roles = roles
        end

        def to_h
          {
            all_apps_visible: all_apps_visible,
            email: email,
            first_name: first_name,
            last_name: last_name,
            provisioning_allowed: provisioning_allowed,
            roles: roles
          }
        end
      end
    end
  end
end
