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
        { http_body_type: 'CertificateCreateRequest', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/certificates' }
      )

      call(web_service_endpoint, **kwargs)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi
    #
    def delete_visible_app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/users/{id}/relationships/visibleApps' }
      )

      call(web_service_endpoint, **kwargs)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi/register_a_new_bundle_id
    #
    def create_bundle_id(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'BundleIdCreateRequest', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/bundleIds' }
      )

      call(web_service_endpoint, **kwargs)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi
    #
    def create_bundle_id_capability(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'BundleIdCapabilityCreateRequest', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/bundleIdCapabilities' }
      )

      call(web_service_endpoint, **kwargs)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi
    #
    def create_beta_build_localization(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'BetaBuildLocalizationCreateRequest', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/betaBuildLocalizations' }
      )

      call(web_service_endpoint, **kwargs)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi
    #
    def user_invitations(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/userInvitations' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_user(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/users/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_bundle_id_capability(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/bundleIdCapabilities/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_user_invitation(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/userInvitations/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_certificate(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/certificates/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_bundle_id(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/bundleIds/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_profile(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/profiles/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_beta_tester(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/betaTesters/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_beta_tester_beta(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/betaTesters/{id}/relationships/betaGroups' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_beta_tester_builds(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/betaTesters/{id}/relationships/builds' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_beta_tester_apps(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/betaTesters/{id}/relationships/apps' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_beta_group(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/betaGroups/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_beta_group_beta_testers(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/betaGroups/{id}/relationships/betaTesters' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_beta_group_builds(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/betaGroups/{id}/relationships/builds' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_app_beta_testers(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/relationships/betaTesters' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_beta_app_localization(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/betaAppLocalizations/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_build_beta_group(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/relationships/betaGroups' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_build_individual_testers(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/relationships/individualTesters' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_beta_build_localizations(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/betaBuildLocalizations/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def create_profile(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'ProfileCreateRequest', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/profiles' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def create_device(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'DeviceCreateRequest', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/devices' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def create_user_invitation(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'UserInvitationCreateRequest', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/userInvitations' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def modify_beta_build_localization(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'BetaBuildLocalizationModifyRequest', http_method: 'patch', url: 'https://api.appstoreconnect.apple.com/v1/betaBuildLocalizations/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def users(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/users' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def user(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/users/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def user_visible_apps(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/users/{id}/visibleApps' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def user_relationships_visible_apps(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/users/{id}/relationships/visibleApps' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def user_invitation(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/userInvitations/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def user_invitation_visible_apps(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/userInvitations/{id}/visibleApps' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def user_invitation_relationships_visible_apps(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/userInvitations/{id}/relationships/visibleApps' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def bundle_id(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/bundleIds/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def bundle_ids(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/bundleIds' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def bundle_id_relationships_profiles(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/bundleIds/{id}/relationships/profiles' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def bundle_id_bundle_id_capabilities(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/bundleIds/{id}/bundleIdCapabilities' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def bundle_id_profiles(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/bundleIds/{id}/profiles' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def bundle_id_relationships_bundle_id_capabilities(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/bundleIds/{id}/relationships/bundleIdCapabilities' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def certificates(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/certificates' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def certificate(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/certificates/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def devices(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/devices' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def device(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/devices/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def financial_reports(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/financeReports' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def sales_reports(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/salesReports' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def profiles(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/profiles' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def profile(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/profiles/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def profile_bundle_id(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/profiles/{id}/bundleId' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def profile_relationships_bundle_id(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/profiles/{id}/relationships/bundleId' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def profile_relationships_certificates(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/profiles/{id}/relationships/certificates' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def profile_devices(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/profiles/{id}/devices' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def profile_certificates(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/profiles/{id}/certificates' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def profile_relationships_devices(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/profiles/{id}/relationships/devices' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_testers(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaTesters' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_tester(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaTesters/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_tester_apps(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaTesters/{id}/apps' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_tester_builds(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaTesters/{id}/builds' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_tester_relationships_builds(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaTesters/{id}/relationships/builds' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_tester_relationships_apps(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaTesters/{id}/relationships/apps' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_tester_beta_groups(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaTesters/{id}/betaGroups' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_tester_relationships_beta_groups(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaTesters/{id}/relationships/betaGroups' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def apps(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_price_points(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/pricePoints' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def in_app_purchase(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v2/inAppPurchases/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def create_in_app_purchase(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'Requests::V2::InAppPurchase::Create', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v2/inAppPurchases' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def update_in_app_purchase(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'Requests::V2::InAppPurchase::Update', http_method: 'patch', url: 'https://api.appstoreconnect.apple.com/v2/inAppPurchases/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_in_app_purchase(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v2/inAppPurchases/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def create_in_app_purchase_submission(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'Requests::V1::InAppPurchaseSubmission::Create', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/inAppPurchaseSubmissions' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def review_screenshot_for_in_app_purchase(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/inAppPurchaseAppStoreReviewScreenshots/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def in_app_purchase_review_screenshot(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v2/inAppPurchases/{id}/appStoreReviewScreenshot' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def create_in_app_purchase_review_screenshot(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'Requests::V1::InAppPurchaseReviewScreenshot::Create', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/inAppPurchaseAppStoreReviewScreenshots' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_in_app_purchases(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/inAppPurchasesV2' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def in_app_purchase_price_points(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v2/inAppPurchases/{id}/pricePoints' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def create_in_app_purchase_price_schedule(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'Requests::V1::InAppPurchasePriceSchedule::Create', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def in_app_purchase_price_schedule(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def in_app_purchase_current_price_point(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/inAppPurchasePriceSchedules/{id}/manualPrices' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def in_app_purchase_localizations(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v2/inAppPurchases/{id}/inAppPurchaseLocalizations' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def in_app_purchase_localization(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/inAppPurchaseLocalizations/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def create_in_app_purchase_localization(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'Requests::V1::InAppPurchaseLocalization::Create', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/inAppPurchaseLocalizations' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def update_in_app_purchase_localization(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'Requests::V1::InAppPurchaseLocalization::Update', http_method: 'patch', url: 'https://api.appstoreconnect.apple.com/v1/inAppPurchaseLocalizations/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_in_app_purchase_localization(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/inAppPurchaseLocalizations/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_beta_groups(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/betaGroups' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_relationships_beta_groups(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/relationships/betaGroups' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_builds(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/builds' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_relationships_builds(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/relationships/builds' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_pre_release_versions(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/preReleaseVersions' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_relationships_pre_release_versions(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/relationships/preReleaseVersions' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_beta_app_review_detail(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/betaAppReviewDetail' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_beta_license_agreement(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/betaLicenseAgreement' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_beta_app_localizations(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/betaAppLocalizations' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_relationships_beta_app_review_detail(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/relationships/betaAppReviewDetail' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_relationships_beta_license_agreement(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/relationships/betaLicenseAgreement' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_relationships_beta_app_localizations(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/relationships/betaAppLocalizations' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def pre_release_versions(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/preReleaseVersions' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def pre_release_version(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/preReleaseVersions/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def pre_release_version_relationships_app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/preReleaseVersions/{id}/relationships/app' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def pre_release_version_builds(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/preReleaseVersions/{id}/builds' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def pre_release_version_app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/preReleaseVersions/{id}/app' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def pre_release_version_relationships_builds(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/preReleaseVersions/{id}/relationships/builds' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_groups(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaGroups' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_group(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaGroups/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_group_apps(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaGroups/{id}/app' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_group_relationships_app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaGroups/{id}/relationships/app' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_group_beta_testers(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaGroups/{id}/betaTesters' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_group_relationships_builds(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaGroups/{id}/relationships/builds' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_group_relationships_beta_testers(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaGroups/{id}/relationships/betaTesters' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def builds(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/app' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_group_builds(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaGroups/{id}/builds' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_pre_release_version(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/preReleaseVersion' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_relationships_pre_release_version(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/relationships/preReleaseVersion' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_relationships_app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/relationships/app' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_individual_testers(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/individualTesters' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_relationships_beta_app_review_submission(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/relationships/betaAppReviewSubmission' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_relationships_individual_testers(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/relationships/individualTesters' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_build_beta_detail(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/buildBetaDetail' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_relationships_build_beta_detail(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/relationships/buildBetaDetail' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_beta_app_review_submission(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/betaAppReviewSubmission' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_relationships_app_encryption_declaration(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/relationships/appEncryptionDeclaration' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_beta_build_localizations(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/betaBuildLocalizations' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_relationships_beta_build_localizations(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/relationships/betaBuildLocalizations' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_app_encryption_declaration(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}/appEncryptionDeclaration' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_encryption_declarations(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_encryption_declaration(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_encryption_declaration_app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations/{id}/app' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_encryption_declaration_relationships_app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/appEncryptionDeclarations/{id}/relationships/app' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_beta_details(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/buildBetaDetails' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_beta_detail(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/buildBetaDetails/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_beta_detail_build(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/buildBetaDetails/{id}/build' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def build_beta_detail_relationships_build(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/buildBetaDetails/{id}/relationships/build' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_app_localizations(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaAppLocalizations' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_app_localization_app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaAppLocalizations/{id}/app' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_app_localization(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaAppLocalizations/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_app_localization_relationships_app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaAppLocalizations/{id}/relationships/app' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_license_agreements(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaLicenseAgreements' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_license_agreement_relationships_app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaLicenseAgreements/{id}/relationships/app' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_license_agreement_app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaLicenseAgreements/{id}/app' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_license_agreement(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaLicenseAgreements/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_build_localization_relationships_build(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaBuildLocalizations/{id}/relationships/build' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_build_localization_build(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaBuildLocalizations/{id}/build' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_build_localizations(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaBuildLocalizations' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_build_localization(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaBuildLocalizations/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_app_review_details(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaAppReviewDetails' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_app_review_detail(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaAppReviewDetails/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_app_review_detail_relationships_app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaAppReviewDetails/{id}/relationships/app' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_app_review_detail_app(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaAppReviewDetails/{id}/app' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_app_review_submissions(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaAppReviewSubmissions' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_app_review_submission(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaAppReviewSubmissions/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_app_review_submission_relationships_build(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaAppReviewSubmissions/{id}/relationships/build' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def beta_app_review_submission_build(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/betaAppReviewSubmissions/{id}/build' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def update_build(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'BuildUpdateRequest', http_method: 'patch', url: 'https://api.appstoreconnect.apple.com/v1/builds/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def create_app_store_version(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'AppStoreVersionCreateRequest', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/appStoreVersions' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def update_app_store_version(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'AppStoreVersionUpdateRequest', http_method: 'patch', url: 'https://api.appstoreconnect.apple.com/v1/appStoreVersions/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_app_store_version(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/appStoreVersions/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def update_app_store_version_build(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'AppStoreVersionBuildLinkageRequest', http_method: 'patch', url: 'https://api.appstoreconnect.apple.com/v1/appStoreVersions/{id}/relationships/build' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def apps_app_store_versions(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/apps/{id}/appStoreVersions' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def app_store_version(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/appStoreVersions/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def create_app_store_version_release_request(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'AppStoreVersionReleaseRequestCreateRequest', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/appStoreVersionReleaseRequests' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def create_app_store_version_phased_release(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'AppStoreVersionPhasedReleaseCreateRequest', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/appStoreVersionPhasedReleases' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def update_app_store_version_phased_release(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'AppStoreVersionPhasedReleaseUpdateRequest', http_method: 'patch', url: 'https://api.appstoreconnect.apple.com/v1/appStoreVersionPhasedReleases/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_app_store_version_phased_release(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/appStoreVersionPhasedReleases/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def create_review_submission(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'ReviewSubmissionCreateRequest', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/reviewSubmissions' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def update_review_submission(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'ReviewSubmissionUpdateRequest', http_method: 'patch', url: 'https://api.appstoreconnect.apple.com/v1/reviewSubmissions/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def delete_review_submission(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'delete', url: 'https://api.appstoreconnect.apple.com/v1/reviewSubmissions/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def review_submissions(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/reviewSubmissions' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def review_submission(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/reviewSubmissions/{id}' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def create_review_submission_item(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_body_type: 'ReviewSubmissionItemCreateRequest', http_method: 'post', url: 'https://api.appstoreconnect.apple.com/v1/reviewSubmissionItems' }
      )

      call(web_service_endpoint, **kwargs)
    end

    def review_submissions_items(**kwargs)
      web_service_endpoint = Schema::WebServiceEndpoint.new(
        { http_method: 'get', url: 'https://api.appstoreconnect.apple.com/v1/reviewSubmissions/{id}/items' }
      )

      call(web_service_endpoint, **kwargs)
    end
  end
end
