# frozen_string_literal: true

module AppStoreConnect
  class UserInvitationCreateRequest
    attr_reader :data

    def initialize(*args)
      @data = Data.new(*args)
    end

    def body
      { 'data' =>
        { 'type' => 'userInvitations', 'attributes' =>
          { 'firstName' => first_name, 'lastName' => last_name, 'email' => email, 'roles' => roles, 'allAppsVisible' => true, 'provisioningAllowed' => true } } }
    end

    def to_h
      { data: data.to_h }
    end
  end
end
