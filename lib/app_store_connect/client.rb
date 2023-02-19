# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated.
#
# WARNING ABOUT GENERATED CODE

module AppStoreConnect
  class Client < Base
    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi
    #
    def create_certificate(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { alias: 'create_certificate', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/certificates', http_body_type: 'CertificateCreateRequest' }
      )

      call(web_service_endpoint, **kwargs)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi/register_a_new_bundle_id
    #
    def create_bundle_id(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { alias: 'create_bundle_id', url: 'https://api.appstoreconnect.apple.com/v1/bundleIds', http_body_type: 'BundleIdCreateRequest', http_method: 'post' }
      )

      call(web_service_endpoint, **kwargs)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi
    #
    def create_bundle_id_capability(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { alias: 'create_bundle_id_capability', url: 'https://api.appstoreconnect.apple.com/v1/bundleIdCapabilities', http_body_type: 'BundleIdCapabilityCreateRequest', http_method: 'post' }
      )

      call(web_service_endpoint, **kwargs)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi
    #
    def create_beta_build_localization(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { alias: 'create_beta_build_localization', url: 'https://api.appstoreconnect.apple.com/v1/betaBuildLocalizations', http_body_type: 'BetaBuildLocalizationCreateRequest', http_method: 'post' }
      )

      call(web_service_endpoint, **kwargs)
    end
  end
end
