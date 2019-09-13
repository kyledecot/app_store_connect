# frozen_string_literal: true

require 'jwt'

module AppStoreConnect
  class Client
    class Authorization
      OPTIONS = %i[key_id issuer_id private_key].freeze

      AUDIENCE = 'appstoreconnect-v1'
      ALGORITHM = 'ES256'

      attr_reader(*OPTIONS)

      def initialize(options)
        @key_id = options.fetch(:key_id)
        @issuer_id = options.fetch(:issuer_id)
        @private_key = OpenSSL::PKey.read(options.fetch(:private_key))
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
end
