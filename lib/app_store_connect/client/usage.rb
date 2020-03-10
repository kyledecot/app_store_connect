# frozen_string_literal: true

require 'app_store_connect/version'
require 'securerandom'
require 'aws-sdk-pinpoint'
require 'aws-sdk-cognitoidentity'

module AppStoreConnect
  class Client
    class Usage
      OPTIONS = %i[analytics_enabled].freeze

      AWS_REGION = 'us-east-1'
      private_constant :AWS_REGION

      AWS_PINPOINT_APPLICATION_ID = '649e0e23f7a249739d954a93d119af45'
      private_constant :AWS_PINPOINT_APPLICATION_ID

      AWS_COGNITO_IDENTITY_POOL_ID = "#{AWS_REGION}:cbf076f5-4bae-4140-8697-69d1f966e5fa"
      private_constant :AWS_COGNITO_IDENTITY_POOL_ID

      def initialize(options = {})
        @enabled = options[:analytics_enabled].to_s == 'true'
        @distinct_id = SecureRandom.uuid
      end

      def track
        return false unless @enabled

        fork do
          timestamp = Time.now.iso8601

          pinpoint_client.put_events(
            application_id: AWS_PINPOINT_APPLICATION_ID,
            events_request: {
              batch_item: {
                usage: {
                  endpoint: {
                    channel_type: 'CUSTOM'
                  },
                  events: {
                    usage: {
                      event_type: 'usage',
                      session: {
                        id: @distinct_id,
                        start_timestamp: timestamp
                      },
                      timestamp: timestamp
                    }
                  }
                }
              }
            }
          )
        end
      end

      private

      def pinpoint_client
        @pinpoint_client ||= Aws::Pinpoint::Client.new(
          region: AWS_REGION,
          secret_access_key: secret_access_key,
          access_key_id: access_key_id,
          session_token: session_token
        )
      end

      def cognito_client
        @cognito_client ||= Aws::CognitoIdentity::Client.new(
          region: AWS_REGION
        )
      end

      def identity_id
        @identity_id ||= cognito_client.get_id(
          identity_pool_id: AWS_COGNITO_IDENTITY_POOL_ID
        ).identity_id
      end

      def credentials
        @credentials ||= cognito_client.get_credentials_for_identity(
          identity_id: identity_id
        ).credentials
      end

      def session_token
        @session_token ||= credentials.session_token
      end

      def secret_access_key
        @secret_access_key ||= credentials.secret_key
      end

      def access_key_id
        @access_key_id ||= credentials.access_key_id
      end
    end
  end
end
