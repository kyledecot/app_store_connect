module AppStoreConnect
  class Client
    ENDPOINT = "https://api.appstoreconnect.apple.com/v1"

    def initialize(key_id:, issuer_id:, private_key_path:)
      @authorization = Authorization.new(
        :private_key_path => private_key_path,
        :key_id => key_id,
        :issuer_id => issuer_id
      )
    end

    def apps
      get("apps")
    end

    def app(id)
      get("apps/#{id}")
    end

    def builds(app_id)
      get("apps/#{app_id}/builds")
    end

    def build(app_id, build_id)
      get("apps/#{app_id}/builds/#{build_id}")
    end

    def invite_user(first_name:, last_name:, email:, roles:)
      invitation = UserInvitationCreateRequest.new(
        :first_name => first_name,
        :last_name => last_name,
        :email => email,
        :roles => roles
      )

      post("userInvitations", invitation.body.to_json)
    end

    def users
      get("users")
    end

    def user_invitations
      get("userInvitations")
    end

    private

    def get(path)
      response = HTTParty.get("#{ENDPOINT}/#{path}", headers: headers)

      response["data"]
    end

    def post(path, body)
      response = HTTParty.post("#{ENDPOINT}/#{path}", headers: headers, body: body)

      response
    end

    def headers
      { "Authorization" => "Bearer #{@authorization.token}", "Content-Type" => "application/json" }
    end
  end
end
