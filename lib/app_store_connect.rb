# frozen_string_literal: true

require 'app_store_connect/client'
require 'app_store_connect/object/type'
require 'app_store_connect/object/attributes'
require 'app_store_connect/object/properties'
require 'app_store_connect/object/data'
require 'app_store_connect/version'

require 'app_store_connect/bundle_id_create_request'
require 'app_store_connect/bundle_id_capability_create_request'
require 'app_store_connect/certificate_create_request'
require 'app_store_connect/device_create_request'
require 'app_store_connect/user_invitation_create_request'
require 'app_store_connect/profile_create_request'
require 'app_store_connect/beta_build_localization_create_request'
require 'app_store_connect/beta_build_localization_modify_request'

module AppStoreConnect
  @config = {}

  class << self
    attr_accessor :config

    def rel(id, type, array = false)
      if array
        return {data: [{id: id, type: type}]}.freeze
      else
        return {data: {id: id, type: type}}.freeze
      end
    end

  end
end
