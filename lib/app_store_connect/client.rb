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

    def headers
      { "Authorization" => "Bearer #{@authorization.token}" }
    end
  end
end
