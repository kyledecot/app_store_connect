# frozen_string_literal: true

require 'jwt'

module AppStoreConnect
  class Authorization
    AUDIENCE = 'appstoreconnect-v1'
    ALGORITHM = 'ES256'

    attr_reader :key_id, :issuer_id, :private_key

    def initialize(key_id:, issuer_id:, private_key:)
      @key_id = key_id
      @issuer_id = issuer_id
      @private_key = OpenSSL::PKey.read(private_key)
    end

    def payload
      {
        exp: Time.now.to_i + 20 * 60,
        iss: issuer_id,
        aud: AUDIENCE
      }
    end

    def header_fields
      { kid: key_id }
    end

    def token
      JWT.encode(payload, private_key, ALGORITHM, header_fields)
    end
  end
end
