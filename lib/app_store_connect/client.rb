# frozen_string_literal: true

require 'active_support/all'

module AppStoreConnect
  class Client
    ENDPOINT = 'https://api.appstoreconnect.apple.com/v1'

    def initialize(**kwargs)
      @options = options(**kwargs)

      @authorization = Authorization.new(
        private_key: @options[:private_key],
        key_id: @options[:key_id],
        issuer_id: @options[:issuer_id]
      )

      @web_service_endpoints_by_name = web_service_endpoints_by_name
    end

    def web_service_endpoint_names
      @web_service_endpoints_by_name.keys
    end

    def respond_to_missing?(method_name, include_private = false)
      web_service_endpoint_names.include?(method_name) || super
    end

    def method_missing(method_name, *args, &block)
      super unless web_service_endpoint_names.include?(method_name)

      web_service_endpoint_by(name: method_name)[:executor].call(*args, &block)
    end

    private

    def web_service_endpoint_by(name:)
      @web_service_endpoints_by_name[name]
    end

    def web_service_endpoints_by_name # rubocop:disable Metrics/AbcSize
      {
        apps: {
          executor: -> { get('apps') }
        },
        app: {
          executor: ->(id) { get("apps/#{id}") }
        },
        builds: {
          executor: ->(app_id) { get("apps/#{app_id}/builds") }
        },
        build: {
          executor: ->(app_id, build_id) { get("apps/#{app_id}/builds/#{build_id}") }
        },
        invite_user: {
          executor: lambda do |first_name:, last_name:, email:, roles:|
            invitation = UserInvitationCreateRequest.new(first_name, last_name, email, roles)

            post('userInvitations', invitation.body.to_json)
          end
        },
        create_bundle_id: {
          executor: lambda do |*args|
            request = BundleIdCreateRequest.new(*args)

            post('bundleIds', body(request))
          end
        },
        users: {
          executor: lambda do |limit: 200|
            get('users', query_params: { 'limit' => limit })
          end
        },
        user_invitations: {
          executor: -> { get('userInvitations') }
        }
      }
    end

    def options(**kwargs)
      AppStoreConnect.config.merge(kwargs).tap do |options|
        %i[key_id issuer_id private_key].each do |key|
          raise ArgumentError, "missing #{key}" unless options.keys.include?(key)
        end
      end
    end

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

    def post(path, body)
      response = HTTParty.post("#{ENDPOINT}/#{path}", headers: headers, body: body)

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
