# frozen_string_literal: true

module AppStoreConnect
  class UserInvitationCreateRequest < Struct.new(:first_name, :last_name, :email, :roles)
    attr_reader :data

    def initialize(*args)
      @data = Data.new(*args)
    end

    def body
      { 'data' =>
        { 'type' => 'userInvitations', 'attributes' =>
          { 'firstName' => first_name, 'lastName' => last_name, 'email' => email, 'roles' => roles, 'allAppsVisible' => true, 'provisioningAllowed' => true } } }
    end

    def to_s
      body.to_json
    end
  end
end
