# frozen_string_literal: true

module AppStoreConnect
  class Client
    class Builder
      TEMPLATE = <<~'SOURCE'
        # frozen_string_literal: true

        # WARNING ABOUT GENERATED CODE
        #
        # This file is generated.
        #
        # WARNING ABOUT GENERATED CODE

        module AppStoreConnect
          class Client < Base
            <%- web_service_endpoints.each do |web_service_endpoint| -%>
            def <%= web_service_endpoint[:alias] -%>(**kwargs)
              web_service_endpoint = Schema::WebServiceEndpoint.new(
                <%= web_service_endpoint %>
              )

              call(web_service_endpoint, **kwargs)
            end

            <%- end -%>
          end
        end
      SOURCE
      private_constant :TEMPLATE

      def web_service_endpoints
        [
          {
            "alias": 'create_certificate',
            "http_method": 'post',
            "url": 'https://api.appstoreconnect.apple.com/v1/certificates',
            "http_body_type": 'CertificateCreateRequest'
          }.symbolize_keys,
          {
            "alias": 'create_bundle_id',
            "url": 'https://api.appstoreconnect.apple.com/v1/bundleIds',
            "http_body_type": 'BundleIdCreateRequest',
            "http_method": 'post'
          }.symbolize_keys,
          {
            "alias": 'create_bundle_id_capability',
            "url": 'https://api.appstoreconnect.apple.com/v1/bundleIdCapabilities',
            "http_body_type": 'BundleIdCapabilityCreateRequest',
            "http_method": 'post'
          }.symbolize_keys,
          {
            "alias": 'create_beta_build_localization',
            "url": 'https://api.appstoreconnect.apple.com/v1/betaBuildLocalizations',
            "http_body_type": 'BetaBuildLocalizationCreateRequest',
            "http_method": 'post'
          }.symbolize_keys
        ]
      end

      def write
        File.write('lib/app_store_connect/client.rb', source)
      end

      def source
        @source ||= begin
          require 'erb'

          erb = ERB.new(TEMPLATE, trim_mode: '%-')

          erb.result(binding)
        end

        @source
      end
    end
  end
end
