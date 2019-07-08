# frozen_string_literal: true

require 'active_support/all'

module AppStoreConnect
  class Client
    ENDPOINT = 'https://api.appstoreconnect.apple.com/v1'

    def initialize(key_id:, issuer_id:, private_key:)
      @authorization = Authorization.new(
        private_key: private_key,
        key_id: key_id,
        issuer_id: issuer_id
      )
    end

    def apps
      get('apps')
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

    def invite_user(**kwargs)
      request = UserInvitationCreateRequest.new(kwargs)

      post('userInvitations', body(request))
    end

    def create_bundle_id(**kwargs)
      request = BundleIdCreateRequest.new(kwargs)

      post('bundleIds', request)
    end

    def users(limit: 200)
      get('users', query_params: { 'limit' => limit })
    end

    def user_invitations
      get('userInvitations')
    end

    private

    def body(request)
      request
        .to_hash
        .deep_transform_keys { |k| k.to_s.camelize(:lower) }
        .to_json
    end

    def get(path, query_params: {})
      response = HTTParty.get("#{ENDPOINT}/#{path}", headers: headers, query: query_params)

      response['data']
    end

    def post(path, request)
      response = HTTParty.post("#{ENDPOINT}/#{path}", headers: headers, body: body(request))

      response
    end

    def headers
      {
        'Authorization' => "Bearer #{@authorization.token}",
        'Content-Type' => 'application/json'
      }
    end
  end
end
