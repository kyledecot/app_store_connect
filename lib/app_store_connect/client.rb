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
      path = '/v1/certificates'
      url = URL.new(path, **kwargs)
      body = CertificateCreateRequest.new(**kwargs)

      post(url, body)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi
    #
    def delete_visible_app(**kwargs)
      path = '/v1/users/{id}/relationships/visibleApps'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi/register_a_new_bundle_id
    #
    def create_bundle_id(**kwargs)
      path = '/v1/bundleIds'
      url = URL.new(path, **kwargs)
      body = BundleIdCreateRequest.new(**kwargs)

      post(url, body)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi
    #
    def create_bundle_id_capability(**kwargs)
      path = '/v1/bundleIdCapabilities'
      url = URL.new(path, **kwargs)
      body = BundleIdCapabilityCreateRequest.new(**kwargs)

      post(url, body)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi
    #
    def create_beta_build_localization(**kwargs)
      path = '/v1/betaBuildLocalizations'
      url = URL.new(path, **kwargs)
      body = BetaBuildLocalizationCreateRequest.new(**kwargs)

      post(url, body)
    end

    #
    # @see https://developer.apple.com/documentation/appstoreconnectapi
    #
    def user_invitations(**kwargs)
      url = URL.new('/v1/userInvitations', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def delete_user(**kwargs)
      path = '/v1/users/{id}'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_bundle_id_capability(**kwargs)
      path = '/v1/bundleIdCapabilities/{id}'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_user_invitation(**kwargs)
      path = '/v1/userInvitations/{id}'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_certificate(**kwargs)
      path = '/v1/certificates/{id}'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_bundle_id(**kwargs)
      path = '/v1/bundleIds/{id}'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_profile(**kwargs)
      path = '/v1/profiles/{id}'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_beta_tester(**kwargs)
      path = '/v1/betaTesters/{id}'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_beta_tester_beta(**kwargs)
      path = '/v1/betaTesters/{id}/relationships/betaGroups'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_beta_tester_builds(**kwargs)
      path = '/v1/betaTesters/{id}/relationships/builds'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_beta_tester_apps(**kwargs)
      path = '/v1/betaTesters/{id}/relationships/apps'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_beta_group(**kwargs)
      path = '/v1/betaGroups/{id}'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_beta_group_beta_testers(**kwargs)
      path = '/v1/betaGroups/{id}/relationships/betaTesters'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_beta_group_builds(**kwargs)
      path = '/v1/betaGroups/{id}/relationships/builds'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_app_beta_testers(**kwargs)
      path = '/v1/apps/{id}/relationships/betaTesters'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_beta_app_localization(**kwargs)
      path = '/v1/betaAppLocalizations/{id}'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_build_beta_group(**kwargs)
      path = '/v1/builds/{id}/relationships/betaGroups'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_build_individual_testers(**kwargs)
      path = '/v1/builds/{id}/relationships/individualTesters'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def delete_beta_build_localizations(**kwargs)
      path = '/v1/betaBuildLocalizations/{id}'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def create_profile(**kwargs)
      path = '/v1/profiles'
      url = URL.new(path, **kwargs)
      body = ProfileCreateRequest.new(**kwargs)

      post(url, body)
    end

    #
    # @see
    #
    def create_device(**kwargs)
      path = '/v1/devices'
      url = URL.new(path, **kwargs)
      body = DeviceCreateRequest.new(**kwargs)

      post(url, body)
    end

    #
    # @see
    #
    def create_user_invitation(**kwargs)
      path = '/v1/userInvitations'
      url = URL.new(path, **kwargs)
      body = UserInvitationCreateRequest.new(**kwargs)

      post(url, body)
    end

    #
    # @see
    #
    def modify_beta_build_localization(**kwargs)
      path = '/v1/betaBuildLocalizations/{id}'
      url = URL.new(path, **kwargs)
      body = BetaBuildLocalizationModifyRequest.new(**kwargs)

      patch(url, body)
    end

    #
    # @see
    #
    def users(**kwargs)
      url = URL.new('/v1/users', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def user(**kwargs)
      url = URL.new('/v1/users/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def user_visible_apps(**kwargs)
      url = URL.new('/v1/users/{id}/visibleApps', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def user_relationships_visible_apps(**kwargs)
      url = URL.new('/v1/users/{id}/relationships/visibleApps', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def user_invitation(**kwargs)
      url = URL.new('/v1/userInvitations/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def user_invitation_visible_apps(**kwargs)
      url = URL.new('/v1/userInvitations/{id}/visibleApps', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def user_invitation_relationships_visible_apps(**kwargs)
      url = URL.new('/v1/userInvitations/{id}/relationships/visibleApps', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def bundle_id(**kwargs)
      url = URL.new('/v1/bundleIds/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def bundle_ids(**kwargs)
      url = URL.new('/v1/bundleIds', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def bundle_id_relationships_profiles(**kwargs)
      url = URL.new('/v1/bundleIds/{id}/relationships/profiles', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def bundle_id_bundle_id_capabilities(**kwargs)
      url = URL.new('/v1/bundleIds/{id}/bundleIdCapabilities', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def bundle_id_profiles(**kwargs)
      url = URL.new('/v1/bundleIds/{id}/profiles', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def bundle_id_relationships_bundle_id_capabilities(**kwargs)
      url = URL.new('/v1/bundleIds/{id}/relationships/bundleIdCapabilities', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def certificates(**kwargs)
      url = URL.new('/v1/certificates', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def certificate(**kwargs)
      url = URL.new('/v1/certificates/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def devices(**kwargs)
      url = URL.new('/v1/devices', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def device(**kwargs)
      url = URL.new('/v1/devices/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def financial_reports(**kwargs)
      url = URL.new('/v1/financeReports', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def sales_reports(**kwargs)
      url = URL.new('/v1/salesReports', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def profiles(**kwargs)
      url = URL.new('/v1/profiles', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def profile(**kwargs)
      url = URL.new('/v1/profiles/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def profile_bundle_id(**kwargs)
      url = URL.new('/v1/profiles/{id}/bundleId', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def profile_relationships_bundle_id(**kwargs)
      url = URL.new('/v1/profiles/{id}/relationships/bundleId', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def profile_relationships_certificates(**kwargs)
      url = URL.new('/v1/profiles/{id}/relationships/certificates', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def profile_devices(**kwargs)
      url = URL.new('/v1/profiles/{id}/devices', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def profile_certificates(**kwargs)
      url = URL.new('/v1/profiles/{id}/certificates', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def profile_relationships_devices(**kwargs)
      url = URL.new('/v1/profiles/{id}/relationships/devices', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_testers(**kwargs)
      url = URL.new('/v1/betaTesters', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_tester(**kwargs)
      url = URL.new('/v1/betaTesters/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_tester_apps(**kwargs)
      url = URL.new('/v1/betaTesters/{id}/apps', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_tester_builds(**kwargs)
      url = URL.new('/v1/betaTesters/{id}/builds', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_tester_relationships_builds(**kwargs)
      url = URL.new('/v1/betaTesters/{id}/relationships/builds', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_tester_relationships_apps(**kwargs)
      url = URL.new('/v1/betaTesters/{id}/relationships/apps', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_tester_beta_groups(**kwargs)
      url = URL.new('/v1/betaTesters/{id}/betaGroups', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_tester_relationships_beta_groups(**kwargs)
      url = URL.new('/v1/betaTesters/{id}/relationships/betaGroups', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def apps(**kwargs)
      url = URL.new('/v1/apps', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app(**kwargs)
      url = URL.new('/v1/apps/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_price_points(**kwargs)
      url = URL.new('/v1/apps/{id}/pricePoints', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def in_app_purchase(**kwargs)
      url = URL.new('/v2/inAppPurchases/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def create_in_app_purchase(**kwargs)
      path = '/v2/inAppPurchases'
      url = URL.new(path, **kwargs)
      body = Requests::V2::InAppPurchase::Create.new(**kwargs)

      post(url, body)
    end

    #
    # @see
    #
    def update_in_app_purchase(**kwargs)
      path = '/v2/inAppPurchases/{id}'
      url = URL.new(path, **kwargs)
      body = Requests::V2::InAppPurchase::Update.new(**kwargs)

      patch(url, body)
    end

    #
    # @see
    #
    def delete_in_app_purchase(**kwargs)
      path = '/v2/inAppPurchases/{id}'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def create_in_app_purchase_submission(**kwargs)
      path = '/v1/inAppPurchaseSubmissions'
      url = URL.new(path, **kwargs)
      body = Requests::V1::InAppPurchaseSubmission::Create.new(**kwargs)

      post(url, body)
    end

    #
    # @see
    #
    def review_screenshot_for_in_app_purchase(**kwargs)
      url = URL.new('/v1/inAppPurchaseAppStoreReviewScreenshots/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def in_app_purchase_review_screenshot(**kwargs)
      url = URL.new('/v2/inAppPurchases/{id}/appStoreReviewScreenshot', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def create_in_app_purchase_review_screenshot(**kwargs)
      path = '/v1/inAppPurchaseAppStoreReviewScreenshots'
      url = URL.new(path, **kwargs)
      body = Requests::V1::InAppPurchaseReviewScreenshot::Create.new(**kwargs)

      post(url, body)
    end

    #
    # @see
    #
    def app_in_app_purchases(**kwargs)
      url = URL.new('/v1/apps/{id}/inAppPurchasesV2', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def in_app_purchase_price_points(**kwargs)
      url = URL.new('/v2/inAppPurchases/{id}/pricePoints', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def create_in_app_purchase_price_schedule(**kwargs)
      path = '/v1/inAppPurchasePriceSchedules'
      url = URL.new(path, **kwargs)
      body = Requests::V1::InAppPurchasePriceSchedule::Create.new(**kwargs)

      post(url, body)
    end

    #
    # @see
    #
    def in_app_purchase_price_schedule(**kwargs)
      url = URL.new('/v1/inAppPurchasePriceSchedules/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def in_app_purchase_current_price_point(**kwargs)
      url = URL.new('/v1/inAppPurchasePriceSchedules/{id}/manualPrices', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def in_app_purchase_localizations(**kwargs)
      url = URL.new('/v2/inAppPurchases/{id}/inAppPurchaseLocalizations', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def in_app_purchase_localization(**kwargs)
      url = URL.new('/v1/inAppPurchaseLocalizations/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def create_in_app_purchase_localization(**kwargs)
      path = '/v1/inAppPurchaseLocalizations'
      url = URL.new(path, **kwargs)
      body = Requests::V1::InAppPurchaseLocalization::Create.new(**kwargs)

      post(url, body)
    end

    #
    # @see
    #
    def update_in_app_purchase_localization(**kwargs)
      path = '/v1/inAppPurchaseLocalizations/{id}'
      url = URL.new(path, **kwargs)
      body = Requests::V1::InAppPurchaseLocalization::Update.new(**kwargs)

      patch(url, body)
    end

    #
    # @see
    #
    def delete_in_app_purchase_localization(**kwargs)
      path = '/v1/inAppPurchaseLocalizations/{id}'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def app_beta_groups(**kwargs)
      url = URL.new('/v1/apps/{id}/betaGroups', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_relationships_beta_groups(**kwargs)
      url = URL.new('/v1/apps/{id}/relationships/betaGroups', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_builds(**kwargs)
      url = URL.new('/v1/apps/{id}/builds', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_relationships_builds(**kwargs)
      url = URL.new('/v1/apps/{id}/relationships/builds', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_pre_release_versions(**kwargs)
      url = URL.new('/v1/apps/{id}/preReleaseVersions', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_relationships_pre_release_versions(**kwargs)
      url = URL.new('/v1/apps/{id}/relationships/preReleaseVersions', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_beta_app_review_detail(**kwargs)
      url = URL.new('/v1/apps/{id}/betaAppReviewDetail', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_beta_license_agreement(**kwargs)
      url = URL.new('/v1/apps/{id}/betaLicenseAgreement', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_beta_app_localizations(**kwargs)
      url = URL.new('/v1/apps/{id}/betaAppLocalizations', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_relationships_beta_app_review_detail(**kwargs)
      url = URL.new('/v1/apps/{id}/relationships/betaAppReviewDetail', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_relationships_beta_license_agreement(**kwargs)
      url = URL.new('/v1/apps/{id}/relationships/betaLicenseAgreement', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_relationships_beta_app_localizations(**kwargs)
      url = URL.new('/v1/apps/{id}/relationships/betaAppLocalizations', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def pre_release_versions(**kwargs)
      url = URL.new('/v1/preReleaseVersions', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def pre_release_version(**kwargs)
      url = URL.new('/v1/preReleaseVersions/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def pre_release_version_relationships_app(**kwargs)
      url = URL.new('/v1/preReleaseVersions/{id}/relationships/app', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def pre_release_version_builds(**kwargs)
      url = URL.new('/v1/preReleaseVersions/{id}/builds', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def pre_release_version_app(**kwargs)
      url = URL.new('/v1/preReleaseVersions/{id}/app', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def pre_release_version_relationships_builds(**kwargs)
      url = URL.new('/v1/preReleaseVersions/{id}/relationships/builds', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_groups(**kwargs)
      url = URL.new('/v1/betaGroups', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_group(**kwargs)
      url = URL.new('/v1/betaGroups/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_group_apps(**kwargs)
      url = URL.new('/v1/betaGroups/{id}/app', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_group_relationships_app(**kwargs)
      url = URL.new('/v1/betaGroups/{id}/relationships/app', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_group_beta_testers(**kwargs)
      url = URL.new('/v1/betaGroups/{id}/betaTesters', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_group_relationships_builds(**kwargs)
      url = URL.new('/v1/betaGroups/{id}/relationships/builds', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_group_relationships_beta_testers(**kwargs)
      url = URL.new('/v1/betaGroups/{id}/relationships/betaTesters', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def builds(**kwargs)
      url = URL.new('/v1/builds', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build(**kwargs)
      url = URL.new('/v1/builds/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_app(**kwargs)
      url = URL.new('/v1/builds/{id}/app', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_group_builds(**kwargs)
      url = URL.new('/v1/betaGroups/{id}/builds', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_pre_release_version(**kwargs)
      url = URL.new('/v1/builds/{id}/preReleaseVersion', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_relationships_pre_release_version(**kwargs)
      url = URL.new('/v1/builds/{id}/relationships/preReleaseVersion', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_relationships_app(**kwargs)
      url = URL.new('/v1/builds/{id}/relationships/app', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_individual_testers(**kwargs)
      url = URL.new('/v1/builds/{id}/individualTesters', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_relationships_beta_app_review_submission(**kwargs)
      url = URL.new('/v1/builds/{id}/relationships/betaAppReviewSubmission', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_relationships_individual_testers(**kwargs)
      url = URL.new('/v1/builds/{id}/relationships/individualTesters', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_build_beta_detail(**kwargs)
      url = URL.new('/v1/builds/{id}/buildBetaDetail', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_relationships_build_beta_detail(**kwargs)
      url = URL.new('/v1/builds/{id}/relationships/buildBetaDetail', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_beta_app_review_submission(**kwargs)
      url = URL.new('/v1/builds/{id}/betaAppReviewSubmission', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_relationships_app_encryption_declaration(**kwargs)
      url = URL.new('/v1/builds/{id}/relationships/appEncryptionDeclaration', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_beta_build_localizations(**kwargs)
      url = URL.new('/v1/builds/{id}/betaBuildLocalizations', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_relationships_beta_build_localizations(**kwargs)
      url = URL.new('/v1/builds/{id}/relationships/betaBuildLocalizations', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_app_encryption_declaration(**kwargs)
      url = URL.new('/v1/builds/{id}/appEncryptionDeclaration', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_encryption_declarations(**kwargs)
      url = URL.new('/v1/appEncryptionDeclarations', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_encryption_declaration(**kwargs)
      url = URL.new('/v1/appEncryptionDeclarations/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_encryption_declaration_app(**kwargs)
      url = URL.new('/v1/appEncryptionDeclarations/{id}/app', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_encryption_declaration_relationships_app(**kwargs)
      url = URL.new('/v1/appEncryptionDeclarations/{id}/relationships/app', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_beta_details(**kwargs)
      url = URL.new('/v1/buildBetaDetails', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_beta_detail(**kwargs)
      url = URL.new('/v1/buildBetaDetails/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_beta_detail_build(**kwargs)
      url = URL.new('/v1/buildBetaDetails/{id}/build', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def build_beta_detail_relationships_build(**kwargs)
      url = URL.new('/v1/buildBetaDetails/{id}/relationships/build', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_app_localizations(**kwargs)
      url = URL.new('/v1/betaAppLocalizations', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_app_localization_app(**kwargs)
      url = URL.new('/v1/betaAppLocalizations/{id}/app', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_app_localization(**kwargs)
      url = URL.new('/v1/betaAppLocalizations/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_app_localization_relationships_app(**kwargs)
      url = URL.new('/v1/betaAppLocalizations/{id}/relationships/app', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_license_agreements(**kwargs)
      url = URL.new('/v1/betaLicenseAgreements', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_license_agreement_relationships_app(**kwargs)
      url = URL.new('/v1/betaLicenseAgreements/{id}/relationships/app', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_license_agreement_app(**kwargs)
      url = URL.new('/v1/betaLicenseAgreements/{id}/app', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_license_agreement(**kwargs)
      url = URL.new('/v1/betaLicenseAgreements/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_build_localization_relationships_build(**kwargs)
      url = URL.new('/v1/betaBuildLocalizations/{id}/relationships/build', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_build_localization_build(**kwargs)
      url = URL.new('/v1/betaBuildLocalizations/{id}/build', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_build_localizations(**kwargs)
      url = URL.new('/v1/betaBuildLocalizations', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_build_localization(**kwargs)
      url = URL.new('/v1/betaBuildLocalizations/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_app_review_details(**kwargs)
      url = URL.new('/v1/betaAppReviewDetails', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_app_review_detail(**kwargs)
      url = URL.new('/v1/betaAppReviewDetails/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_app_review_detail_relationships_app(**kwargs)
      url = URL.new('/v1/betaAppReviewDetails/{id}/relationships/app', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_app_review_detail_app(**kwargs)
      url = URL.new('/v1/betaAppReviewDetails/{id}/app', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_app_review_submissions(**kwargs)
      url = URL.new('/v1/betaAppReviewSubmissions', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_app_review_submission(**kwargs)
      url = URL.new('/v1/betaAppReviewSubmissions/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_app_review_submission_relationships_build(**kwargs)
      url = URL.new('/v1/betaAppReviewSubmissions/{id}/relationships/build', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def beta_app_review_submission_build(**kwargs)
      url = URL.new('/v1/betaAppReviewSubmissions/{id}/build', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def update_build(**kwargs)
      path = '/v1/builds/{id}'
      url = URL.new(path, **kwargs)
      body = BuildUpdateRequest.new(**kwargs)

      patch(url, body)
    end

    #
    # @see
    #
    def create_app_store_version(**kwargs)
      path = '/v1/appStoreVersions'
      url = URL.new(path, **kwargs)
      body = AppStoreVersionCreateRequest.new(**kwargs)

      post(url, body)
    end

    #
    # @see
    #
    def update_app_store_version(**kwargs)
      path = '/v1/appStoreVersions/{id}'
      url = URL.new(path, **kwargs)
      body = AppStoreVersionUpdateRequest.new(**kwargs)

      patch(url, body)
    end

    #
    # @see
    #
    def delete_app_store_version(**kwargs)
      path = '/v1/appStoreVersions/{id}'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def update_app_store_version_build(**kwargs)
      path = '/v1/appStoreVersions/{id}/relationships/build'
      url = URL.new(path, **kwargs)
      body = AppStoreVersionBuildLinkageRequest.new(**kwargs)

      patch(url, body)
    end

    #
    # @see
    #
    def apps_app_store_versions(**kwargs)
      url = URL.new('/v1/apps/{id}/appStoreVersions', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def app_store_version(**kwargs)
      url = URL.new('/v1/appStoreVersions/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def create_app_store_version_release_request(**kwargs)
      path = '/v1/appStoreVersionReleaseRequests'
      url = URL.new(path, **kwargs)
      body = AppStoreVersionReleaseRequestCreateRequest.new(**kwargs)

      post(url, body)
    end

    #
    # @see
    #
    def create_app_store_version_phased_release(**kwargs)
      path = '/v1/appStoreVersionPhasedReleases'
      url = URL.new(path, **kwargs)
      body = AppStoreVersionPhasedReleaseCreateRequest.new(**kwargs)

      post(url, body)
    end

    #
    # @see
    #
    def update_app_store_version_phased_release(**kwargs)
      path = '/v1/appStoreVersionPhasedReleases/{id}'
      url = URL.new(path, **kwargs)
      body = AppStoreVersionPhasedReleaseUpdateRequest.new(**kwargs)

      patch(url, body)
    end

    #
    # @see
    #
    def delete_app_store_version_phased_release(**kwargs)
      path = '/v1/appStoreVersionPhasedReleases/{id}'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def create_review_submission(**kwargs)
      path = '/v1/reviewSubmissions'
      url = URL.new(path, **kwargs)
      body = ReviewSubmissionCreateRequest.new(**kwargs)

      post(url, body)
    end

    #
    # @see
    #
    def update_review_submission(**kwargs)
      path = '/v1/reviewSubmissions/{id}'
      url = URL.new(path, **kwargs)
      body = ReviewSubmissionUpdateRequest.new(**kwargs)

      patch(url, body)
    end

    #
    # @see
    #
    def delete_review_submission(**kwargs)
      path = '/v1/reviewSubmissions/{id}'
      url = URL.new(path, **kwargs)

      delete(url)
    end

    #
    # @see
    #
    def review_submissions(**kwargs)
      url = URL.new('/v1/reviewSubmissions', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def review_submission(**kwargs)
      url = URL.new('/v1/reviewSubmissions/{id}', **kwargs)

      get(url)
    end

    #
    # @see
    #
    def create_review_submission_item(**kwargs)
      path = '/v1/reviewSubmissionItems'
      url = URL.new(path, **kwargs)
      body = ReviewSubmissionItemCreateRequest.new(**kwargs)

      post(url, body)
    end

    #
    # @see
    #
    def review_submissions_items(**kwargs)
      url = URL.new('/v1/reviewSubmissions/{id}/items', **kwargs)

      get(url)
    end
  end
end
