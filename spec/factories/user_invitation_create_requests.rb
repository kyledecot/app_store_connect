FactoryBot.define do 
  factory :user_invitation_create_request, :class => AppStoreConnect::UserInvitationCreateRequest do 
    skip_create

    transient do 
      first_name { 'Kyle' }
      last_name { 'Decot' }
      email { 'kyle.decot@icloud.com' }
      provisioning_allowed { true }
      all_apps_visible { true }
      roles { ['ADMIN'] }
    end 

    initialize_with do 
      AppStoreConnect::UserInvitationCreateRequest.new(
        first_name: first_name,
        last_name: last_name, 
        email: email,
        provisioning_allowed: provisioning_allowed,
        all_apps_visible: all_apps_visible,
        roles: roles
      )
    end 
  end 
end
