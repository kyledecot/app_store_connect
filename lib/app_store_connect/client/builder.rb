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
            <%= Method.new(web_service_endpoint) %>
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
            "path": '/v1/certificates',
            "http_body_type": 'CertificateCreateRequest',
            "see": 'https://developer.apple.com/documentation/appstoreconnectapi'
          },
          {
            "http_method": 'delete',
            "path": '/v1/users/{id}/relationships/visibleApps',
            "alias": 'delete_visible_app',
            "see": 'https://developer.apple.com/documentation/appstoreconnectapi'
          },
          {
            "alias": 'create_bundle_id',
            "path": '/v1/bundleIds',
            "http_body_type": 'BundleIdCreateRequest',
            "http_method": 'post',
            "see": 'https://developer.apple.com/documentation/appstoreconnectapi/register_a_new_bundle_id'
          },
          {
            "alias": 'create_bundle_id_capability',
            "path": '/v1/bundleIdCapabilities',
            "http_body_type": 'BundleIdCapabilityCreateRequest',
            "http_method": 'post',
            "see": 'https://developer.apple.com/documentation/appstoreconnectapi'
          },
          {
            "alias": 'create_beta_build_localization',
            "path": '/v1/betaBuildLocalizations',
            "http_body_type": 'BetaBuildLocalizationCreateRequest',
            "http_method": 'post',
            "see": 'https://developer.apple.com/documentation/appstoreconnectapi'
          },
          {
            "http_method": 'get',
            "path": '/v1/userInvitations',
            "alias": 'user_invitations',
            "see": 'https://developer.apple.com/documentation/appstoreconnectapi'
          },
          {
            "http_method": 'delete',
            "path": '/v1/users/{id}',
            "alias": 'delete_user'
          },

          {
            "http_method": 'delete',
            "path": '/v1/bundleIdCapabilities/{id}',
            "alias": 'delete_bundle_id_capability'
          },
          {
            "http_method": 'delete',
            "path": '/v1/userInvitations/{id}',
            "alias": 'delete_user_invitation'
          },
          {
            "http_method": 'delete',
            "path": '/v1/certificates/{id}',
            "alias": 'delete_certificate'
          },
          {
            "http_method": 'delete',
            "path": '/v1/bundleIds/{id}',
            "alias": 'delete_bundle_id'
          },
          {
            "http_method": 'delete',
            "path": '/v1/profiles/{id}',
            "alias": 'delete_profile'
          },
          {
            "http_method": 'delete',
            "path": '/v1/betaTesters/{id}',
            "alias": 'delete_beta_tester'
          },
          {
            "http_method": 'delete',
            "path": '/v1/betaTesters/{id}/relationships/betaGroups',
            "alias": 'delete_beta_tester_beta'
          },
          {
            "http_method": 'delete',
            "path": '/v1/betaTesters/{id}/relationships/builds',
            "alias": 'delete_beta_tester_builds'
          },
          {
            "http_method": 'delete',
            "path": '/v1/betaTesters/{id}/relationships/apps',
            "alias": 'delete_beta_tester_apps'
          },
          {
            "http_method": 'delete',
            "path": '/v1/betaGroups/{id}',
            "alias": 'delete_beta_group'
          },
          {
            "http_method": 'delete',
            "path": '/v1/betaGroups/{id}/relationships/betaTesters',
            "alias": 'delete_beta_group_beta_testers'
          },
          {
            "http_method": 'delete',
            "path": '/v1/betaGroups/{id}/relationships/builds',
            "alias": 'delete_beta_group_builds'
          },
          {
            "http_method": 'delete',
            "path": '/v1/apps/{id}/relationships/betaTesters',
            "alias": 'delete_app_beta_testers'
          },
          {
            "http_method": 'delete',
            "path": '/v1/betaAppLocalizations/{id}',
            "alias": 'delete_beta_app_localization'
          },
          {
            "http_method": 'delete',
            "path": '/v1/builds/{id}/relationships/betaGroups',
            "alias": 'delete_build_beta_group'
          },
          {
            "http_method": 'delete',
            "path": '/v1/builds/{id}/relationships/individualTesters',
            "alias": 'delete_build_individual_testers'
          },
          {
            "http_method": 'delete',
            "path": '/v1/betaBuildLocalizations/{id}',
            "alias": 'delete_beta_build_localizations'
          },
          {
            "alias": 'create_profile',
            "http_method": 'post',
            "path": '/v1/profiles',
            "http_body_type": 'ProfileCreateRequest'
          },
          {
            "alias": 'create_device',
            "http_method": 'post',
            "path": '/v1/devices',
            "http_body_type": 'DeviceCreateRequest'
          },
          {
            "alias": 'create_user_invitation',
            "path": '/v1/userInvitations',
            "http_body_type": 'UserInvitationCreateRequest',
            "http_method": 'post'
          },
          {
            "alias": 'modify_beta_build_localization',
            "path": '/v1/betaBuildLocalizations/{id}',
            "http_body_type": 'BetaBuildLocalizationModifyRequest',
            "http_method": 'patch'
          },
          {
            "http_method": 'get',
            "path": '/v1/users',
            "alias": 'users'
          },
          {
            "http_method": 'get',
            "path": '/v1/users/{id}',
            "alias": 'user'
          },
          {
            "http_method": 'get',
            "path": '/v1/users/{id}/visibleApps',
            "alias": 'user_visible_apps'
          },
          {
            "http_method": 'get',
            "path": '/v1/users/{id}/relationships/visibleApps',
            "alias": 'user_relationships_visible_apps'
          },
          {
            "http_method": 'get',
            "path": '/v1/userInvitations/{id}',
            "alias": 'user_invitation'
          },
          {
            "http_method": 'get',
            "path": '/v1/userInvitations/{id}/visibleApps',
            "alias": 'user_invitation_visible_apps'
          },
          {
            "http_method": 'get',
            "path": '/v1/userInvitations/{id}/relationships/visibleApps',
            "alias": 'user_invitation_relationships_visible_apps'
          },
          {
            "http_method": 'get',
            "path": '/v1/bundleIds/{id}',
            "alias": 'bundle_id'
          },
          {
            "http_method": 'get',
            "path": '/v1/bundleIds',
            "alias": 'bundle_ids'
          },
          {
            "http_method": 'get',
            "path": '/v1/bundleIds/{id}/relationships/profiles',
            "alias": 'bundle_id_relationships_profiles'
          },
          {
            "http_method": 'get',
            "path": '/v1/bundleIds/{id}/bundleIdCapabilities',
            "alias": 'bundle_id_bundle_id_capabilities'
          },
          {
            "http_method": 'get',
            "path": '/v1/bundleIds/{id}/profiles',
            "alias": 'bundle_id_profiles'
          },
          {
            "http_method": 'get',
            "path": '/v1/bundleIds/{id}/relationships/bundleIdCapabilities',
            "alias": 'bundle_id_relationships_bundle_id_capabilities'
          },
          {
            "http_method": 'get',
            "path": '/v1/certificates',
            "alias": 'certificates'
          },
          {
            "http_method": 'get',
            "path": '/v1/certificates/{id}',
            "alias": 'certificate'
          },
          {
            "http_method": 'get',
            "path": '/v1/devices',
            "alias": 'devices'
          },
          {
            "http_method": 'get',
            "path": '/v1/devices/{id}',
            "alias": 'device'
          },
          {
            "http_method": 'get',
            "path": '/v1/financeReports',
            "alias": 'financial_reports'
          },
          {
            "http_method": 'get',
            "path": '/v1/salesReports',
            "alias": 'sales_reports'
          },
          {
            "http_method": 'get',
            "path": '/v1/profiles',
            "alias": 'profiles'
          },
          {
            "http_method": 'get',
            "path": '/v1/profiles/{id}',
            "alias": 'profile'
          },
          {
            "http_method": 'get',
            "path": '/v1/profiles/{id}/bundleId',
            "alias": 'profile_bundle_id'
          },
          {
            "http_method": 'get',
            "path": '/v1/profiles/{id}/relationships/bundleId',
            "alias": 'profile_relationships_bundle_id'
          },
          {
            "http_method": 'get',
            "path": '/v1/profiles/{id}/relationships/certificates',
            "alias": 'profile_relationships_certificates'
          },
          {
            "http_method": 'get',
            "path": '/v1/profiles/{id}/devices',
            "alias": 'profile_devices'
          },
          {
            "http_method": 'get',
            "path": '/v1/profiles/{id}/certificates',
            "alias": 'profile_certificates'
          },
          {
            "http_method": 'get',
            "path": '/v1/profiles/{id}/relationships/devices',
            "alias": 'profile_relationships_devices'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaTesters',
            "alias": 'beta_testers'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaTesters/{id}',
            "alias": 'beta_tester'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaTesters/{id}/apps',
            "alias": 'beta_tester_apps'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaTesters/{id}/builds',
            "alias": 'beta_tester_builds'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaTesters/{id}/relationships/builds',
            "alias": 'beta_tester_relationships_builds'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaTesters/{id}/relationships/apps',
            "alias": 'beta_tester_relationships_apps'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaTesters/{id}/betaGroups',
            "alias": 'beta_tester_beta_groups'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaTesters/{id}/relationships/betaGroups',
            "alias": 'beta_tester_relationships_beta_groups'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps',
            "alias": 'apps'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}',
            "alias": 'app'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}/pricePoints',
            "alias": 'app_price_points'
          },
          {
            "http_method": 'get',
            "path": '/v2/inAppPurchases/{id}',
            "alias": 'in_app_purchase'
          },
          {
            "alias": 'create_in_app_purchase',
            "http_body_type": 'Requests::V2::InAppPurchase::Create',
            "http_method": 'post',
            "path": '/v2/inAppPurchases'
          },
          {
            "alias": 'update_in_app_purchase',
            "http_body_type": 'Requests::V2::InAppPurchase::Update',
            "http_method": 'patch',
            "path": '/v2/inAppPurchases/{id}'
          },
          {
            "alias": 'delete_in_app_purchase',
            "http_method": 'delete',
            "path": '/v2/inAppPurchases/{id}'
          },
          {
            "alias": 'create_in_app_purchase_submission',
            "http_body_type": 'Requests::V1::InAppPurchaseSubmission::Create',
            "http_method": 'post',
            "path": '/v1/inAppPurchaseSubmissions'
          },
          {
            "alias": 'review_screenshot_for_in_app_purchase',
            "http_method": 'get',
            "path": '/v1/inAppPurchaseAppStoreReviewScreenshots/{id}'
          },
          {
            "alias": 'in_app_purchase_review_screenshot',
            "http_method": 'get',
            "path": '/v2/inAppPurchases/{id}/appStoreReviewScreenshot'
          },
          {
            "alias": 'create_in_app_purchase_review_screenshot',
            "http_body_type": 'Requests::V1::InAppPurchaseReviewScreenshot::Create',
            "http_method": 'post',
            "path": '/v1/inAppPurchaseAppStoreReviewScreenshots'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}/inAppPurchasesV2',
            "alias": 'app_in_app_purchases'
          },
          {
            "http_method": 'get',
            "path": '/v2/inAppPurchases/{id}/pricePoints',
            "alias": 'in_app_purchase_price_points'
          },
          {
            "alias": 'create_in_app_purchase_price_schedule',
            "http_body_type": 'Requests::V1::InAppPurchasePriceSchedule::Create',
            "http_method": 'post',
            "path": '/v1/inAppPurchasePriceSchedules'
          },
          {
            "alias": 'in_app_purchase_price_schedule',
            "http_method": 'get',
            "path": '/v1/inAppPurchasePriceSchedules/{id}'
          },
          {
            "alias": 'in_app_purchase_current_price_point',
            "http_method": 'get',
            "path": '/v1/inAppPurchasePriceSchedules/{id}/manualPrices'
          },
          {
            "alias": 'in_app_purchase_localizations',
            "http_method": 'get',
            "path": '/v2/inAppPurchases/{id}/inAppPurchaseLocalizations'
          },
          {
            "alias": 'in_app_purchase_localization',
            "http_method": 'get',
            "path": '/v1/inAppPurchaseLocalizations/{id}'
          },
          {
            "alias": 'create_in_app_purchase_localization',
            "http_body_type": 'Requests::V1::InAppPurchaseLocalization::Create',
            "http_method": 'post',
            "path": '/v1/inAppPurchaseLocalizations'
          },
          {
            "alias": 'update_in_app_purchase_localization',
            "http_body_type": 'Requests::V1::InAppPurchaseLocalization::Update',
            "http_method": 'patch',
            "path": '/v1/inAppPurchaseLocalizations/{id}'
          },
          {
            "alias": 'delete_in_app_purchase_localization',
            "http_method": 'delete',
            "path": '/v1/inAppPurchaseLocalizations/{id}'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}/betaGroups',
            "alias": 'app_beta_groups'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}/relationships/betaGroups',
            "alias": 'app_relationships_beta_groups'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}/builds',
            "alias": 'app_builds'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}/relationships/builds',
            "alias": 'app_relationships_builds'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}/preReleaseVersions',
            "alias": 'app_pre_release_versions'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}/relationships/preReleaseVersions',
            "alias": 'app_relationships_pre_release_versions'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}/betaAppReviewDetail',
            "alias": 'app_beta_app_review_detail'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}/betaLicenseAgreement',
            "alias": 'app_beta_license_agreement'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}/betaAppLocalizations',
            "alias": 'app_beta_app_localizations'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}/relationships/betaAppReviewDetail',
            "alias": 'app_relationships_beta_app_review_detail'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}/relationships/betaLicenseAgreement',
            "alias": 'app_relationships_beta_license_agreement'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}/relationships/betaAppLocalizations',
            "alias": 'app_relationships_beta_app_localizations'
          },
          {
            "http_method": 'get',
            "path": '/v1/preReleaseVersions',
            "alias": 'pre_release_versions'
          },
          {
            "http_method": 'get',
            "path": '/v1/preReleaseVersions/{id}',
            "alias": 'pre_release_version'
          },
          {
            "http_method": 'get',
            "path": '/v1/preReleaseVersions/{id}/relationships/app',
            "alias": 'pre_release_version_relationships_app'
          },
          {
            "http_method": 'get',
            "path": '/v1/preReleaseVersions/{id}/builds',
            "alias": 'pre_release_version_builds'
          },
          {
            "http_method": 'get',
            "path": '/v1/preReleaseVersions/{id}/app',
            "alias": 'pre_release_version_app'
          },
          {
            "http_method": 'get',
            "path": '/v1/preReleaseVersions/{id}/relationships/builds',
            "alias": 'pre_release_version_relationships_builds'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaGroups',
            "alias": 'beta_groups'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaGroups/{id}',
            "alias": 'beta_group'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaGroups/{id}/app',
            "alias": 'beta_group_apps'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaGroups/{id}/relationships/app',
            "alias": 'beta_group_relationships_app'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaGroups/{id}/betaTesters',
            "alias": 'beta_group_beta_testers'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaGroups/{id}/relationships/builds',
            "alias": 'beta_group_relationships_builds'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaGroups/{id}/relationships/betaTesters',
            "alias": 'beta_group_relationships_beta_testers'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds',
            "alias": 'builds'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds/{id}',
            "alias": 'build'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds/{id}/app',
            "alias": 'build_app'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaGroups/{id}/builds',
            "alias": 'beta_group_builds'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds/{id}/preReleaseVersion',
            "alias": 'build_pre_release_version'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds/{id}/relationships/preReleaseVersion',
            "alias": 'build_relationships_pre_release_version'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds/{id}/relationships/app',
            "alias": 'build_relationships_app'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds/{id}/individualTesters',
            "alias": 'build_individual_testers'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds/{id}/relationships/betaAppReviewSubmission',
            "alias": 'build_relationships_beta_app_review_submission'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds/{id}/relationships/individualTesters',
            "alias": 'build_relationships_individual_testers'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds/{id}/buildBetaDetail',
            "alias": 'build_build_beta_detail'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds/{id}/relationships/buildBetaDetail',
            "alias": 'build_relationships_build_beta_detail'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds/{id}/betaAppReviewSubmission',
            "alias": 'build_beta_app_review_submission'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds/{id}/relationships/appEncryptionDeclaration',
            "alias": 'build_relationships_app_encryption_declaration'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds/{id}/betaBuildLocalizations',
            "alias": 'build_beta_build_localizations'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds/{id}/relationships/betaBuildLocalizations',
            "alias": 'build_relationships_beta_build_localizations'
          },
          {
            "http_method": 'get',
            "path": '/v1/builds/{id}/appEncryptionDeclaration',
            "alias": 'build_app_encryption_declaration'
          },
          {
            "http_method": 'get',
            "path": '/v1/appEncryptionDeclarations',
            "alias": 'app_encryption_declarations'
          },
          {
            "http_method": 'get',
            "path": '/v1/appEncryptionDeclarations/{id}',
            "alias": 'app_encryption_declaration'
          },
          {
            "http_method": 'get',
            "path": '/v1/appEncryptionDeclarations/{id}/app',
            "alias": 'app_encryption_declaration_app'
          },
          {
            "http_method": 'get',
            "path": '/v1/appEncryptionDeclarations/{id}/relationships/app',
            "alias": 'app_encryption_declaration_relationships_app'
          },
          {
            "http_method": 'get',
            "path": '/v1/buildBetaDetails',
            "alias": 'build_beta_details'
          },
          {
            "http_method": 'get',
            "path": '/v1/buildBetaDetails/{id}',
            "alias": 'build_beta_detail'
          },
          {
            "http_method": 'get',
            "path": '/v1/buildBetaDetails/{id}/build',
            "alias": 'build_beta_detail_build'
          },
          {
            "http_method": 'get',
            "path": '/v1/buildBetaDetails/{id}/relationships/build',
            "alias": 'build_beta_detail_relationships_build'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaAppLocalizations',
            "alias": 'beta_app_localizations'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaAppLocalizations/{id}/app',
            "alias": 'beta_app_localization_app'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaAppLocalizations/{id}',
            "alias": 'beta_app_localization'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaAppLocalizations/{id}/relationships/app',
            "alias": 'beta_app_localization_relationships_app'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaLicenseAgreements',
            "alias": 'beta_license_agreements'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaLicenseAgreements/{id}/relationships/app',
            "alias": 'beta_license_agreement_relationships_app'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaLicenseAgreements/{id}/app',
            "alias": 'beta_license_agreement_app'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaLicenseAgreements/{id}',
            "alias": 'beta_license_agreement'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaBuildLocalizations/{id}/relationships/build',
            "alias": 'beta_build_localization_relationships_build'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaBuildLocalizations/{id}/build',
            "alias": 'beta_build_localization_build'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaBuildLocalizations',
            "alias": 'beta_build_localizations'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaBuildLocalizations/{id}',
            "alias": 'beta_build_localization'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaAppReviewDetails',
            "alias": 'beta_app_review_details'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaAppReviewDetails/{id}',
            "alias": 'beta_app_review_detail'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaAppReviewDetails/{id}/relationships/app',
            "alias": 'beta_app_review_detail_relationships_app'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaAppReviewDetails/{id}/app',
            "alias": 'beta_app_review_detail_app'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaAppReviewSubmissions',
            "alias": 'beta_app_review_submissions'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaAppReviewSubmissions/{id}',
            "alias": 'beta_app_review_submission'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaAppReviewSubmissions/{id}/relationships/build',
            "alias": 'beta_app_review_submission_relationships_build'
          },
          {
            "http_method": 'get',
            "path": '/v1/betaAppReviewSubmissions/{id}/build',
            "alias": 'beta_app_review_submission_build'
          },

          {
            "http_method": 'patch',
            "path": '/v1/builds/{id}',
            "http_body_type": 'BuildUpdateRequest',
            "alias": 'update_build'
          },

          {
            "path": '/v1/appStoreVersions',
            "http_body_type": 'AppStoreVersionCreateRequest',
            "http_method": 'post',
            "alias": 'create_app_store_version'
          },
          {
            "http_method": 'patch',
            "path": '/v1/appStoreVersions/{id}',
            "http_body_type": 'AppStoreVersionUpdateRequest',
            "alias": 'update_app_store_version'
          },
          {
            "http_method": 'delete',
            "path": '/v1/appStoreVersions/{id}',
            "alias": 'delete_app_store_version'
          },
          {
            "http_method": 'patch',
            "path": '/v1/appStoreVersions/{id}/relationships/build',
            "http_body_type": 'AppStoreVersionBuildLinkageRequest',
            "alias": 'update_app_store_version_build'
          },
          {
            "http_method": 'get',
            "path": '/v1/apps/{id}/appStoreVersions',
            "alias": 'apps_app_store_versions'
          },
          {
            "http_method": 'get',
            "path": '/v1/appStoreVersions/{id}',
            "alias": 'app_store_version'
          },

          {
            "path": '/v1/appStoreVersionReleaseRequests',
            "http_body_type": 'AppStoreVersionReleaseRequestCreateRequest',
            "http_method": 'post',
            "alias": 'create_app_store_version_release_request'
          },

          {
            "path": '/v1/appStoreVersionPhasedReleases',
            "http_body_type": 'AppStoreVersionPhasedReleaseCreateRequest',
            "http_method": 'post',
            "alias": 'create_app_store_version_phased_release'
          },
          {
            "http_method": 'patch',
            "path": '/v1/appStoreVersionPhasedReleases/{id}',
            "http_body_type": 'AppStoreVersionPhasedReleaseUpdateRequest',
            "alias": 'update_app_store_version_phased_release'
          },
          {
            "http_method": 'delete',
            "path": '/v1/appStoreVersionPhasedReleases/{id}',
            "alias": 'delete_app_store_version_phased_release'
          },

          {
            "path": '/v1/reviewSubmissions',
            "http_body_type": 'ReviewSubmissionCreateRequest',
            "http_method": 'post',
            "alias": 'create_review_submission'
          },
          {
            "http_method": 'patch',
            "path": '/v1/reviewSubmissions/{id}',
            "http_body_type": 'ReviewSubmissionUpdateRequest',
            "alias": 'update_review_submission'
          },
          {
            "http_method": 'delete',
            "path": '/v1/reviewSubmissions/{id}',
            "alias": 'delete_review_submission'
          },
          {
            "http_method": 'get',
            "path": '/v1/reviewSubmissions',
            "alias": 'review_submissions'
          },
          {
            "http_method": 'get',
            "path": '/v1/reviewSubmissions/{id}',
            "alias": 'review_submission'
          },
          {
            "path": '/v1/reviewSubmissionItems',
            "http_body_type": 'ReviewSubmissionItemCreateRequest',
            "http_method": 'post',
            "alias": 'create_review_submission_item'
          },
          {
            "path": '/v1/reviewSubmissions/{id}/items',
            "http_method": 'get',
            "alias": 'review_submissions_items'
          }
        ].map(&:symbolize_keys)
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
