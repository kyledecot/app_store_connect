module AppStoreConnect
  class Authorization
    def initialize(key_id:, issuer_id:, private_key_path:)
      @key_id = key_id
      @issuer_id = issuer_id
      @private_key_path = private_key_path
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
  end
end
