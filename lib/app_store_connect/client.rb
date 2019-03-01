module AppStoreConnect
  class Client
    def initialize(key_id:, issuer_id:, private_key_path:)
      @key_id = key_id
      @issuer_id = issuer_id
      @private_key_path = private_key_path
    end

    def apps
      response = HTTParty.get('https://api.appstoreconnect.apple.com/v1/apps', headers: headers)
      binding.pry
      # json = JSON.parse(response.body["data"])
      #
      # puts response.body, response.code, response.message, response.headers.inspect
    end

    private

    def payload
      exp = Time.now.to_i + 20 * 60

      {
        exp: exp,
        iss: @issuer_id,
        aud: "appstoreconnect-v1"
      }
    end

    def token
      JWT.encode(payload, private_key, 'ES256', kid: @key_id )
    end

    def private_key
      @private_key ||= begin
        path = File.expand_path(@private_key_path)
        OpenSSL::PKey.read(File.read(path))
      end
    end

    def headers
      {
        "Authorization" => "Bearer #{token}"
      }
    end
  end
end
