# frozen_string_literal: true

require 'app_store_connect/client'
require 'app_store_connect/object/type'
require 'app_store_connect/object/id'
require 'app_store_connect/object/attributes'
require 'app_store_connect/object/properties'
require 'app_store_connect/object/data'
require 'app_store_connect/version'

require 'app_store_connect/app_store_version_build_linkage_request'
require 'app_store_connect/app_store_version_create_request'
require 'app_store_connect/app_store_version_phased_release_create_request'
require 'app_store_connect/app_store_version_phased_release_update_request'
require 'app_store_connect/app_store_version_release_request_create_request'
require 'app_store_connect/app_store_version_update_request'
require 'app_store_connect/build_update_request'
require 'app_store_connect/bundle_id_capability_create_request'
require 'app_store_connect/bundle_id_create_request'
require 'app_store_connect/certificate_create_request'
require 'app_store_connect/device_create_request'
require 'app_store_connect/profile_create_request'
require 'app_store_connect/beta_build_localization_create_request'
require 'app_store_connect/beta_build_localization_modify_request'
require 'app_store_connect/review_submission_create_request'
require 'app_store_connect/review_submission_item_create_request'
require 'app_store_connect/review_submission_update_request'
require 'app_store_connect/user_invitation_create_request'

module AppStoreConnect
  @config = {}

  class << self
    attr_accessor :config

    def rel(id, type, array: false)
      if array
        { data: [{ id: id, type: type }] }.freeze
      else
        { data: { id: id, type: type } }.freeze
      end
    end
  end
end
