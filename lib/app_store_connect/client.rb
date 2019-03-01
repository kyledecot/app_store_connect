module AppStoreConnect
  class Client
    ENDPOINT = "https://api.appstoreconnect.apple.com/v1"

    def initialize(key_id:, issuer_id:, private_key_path:)
      @key_id = key_id
      @issuer_id = issuer_id
      @private_key_path = private_key_path
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

    private

    def get(path)
      response = HTTParty.get("#{ENDPOINT}/#{path}", headers: headers)

      response["data"]
    end

    def payload
      {
        exp: Time.now.to_i + 20 * 60,
        iss: @issuer_id,
        aud: "appstoreconnect-v1"
      }
    end

    def token
      JWT.encode(payload, private_key, "ES256", kid: @key_id)
    end

    def private_key
      @private_key ||= begin
        path = File.expand_path(@private_key_path)
        OpenSSL::PKey.read(File.read(path))
      end
    end

    def headers
      { "Authorization" => "Bearer #{token}" }
    end
  end
end
