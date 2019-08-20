# frozen_string_literal: true

require 'app_store_connect/client'
require 'app_store_connect/factory'
require 'app_store_connect/object/type'
require 'app_store_connect/object/attributes'
require 'app_store_connect/object/properties'
require 'app_store_connect/object/data'
require 'app_store_connect/schema'
require 'app_store_connect/type'
require 'app_store_connect/version'

require 'app_store_connect/bundle_id_create_request'
require 'app_store_connect/certificate_create_request'
require 'app_store_connect/device_create_request'
require 'app_store_connect/user_invitation_create_request'
require 'app_store_connect/profile_create_request'

module AppStoreConnect
  @config = {}

  SCHEMA = Schema.new(File.join(__dir__, './config/schema.json'))

  class << self
    attr_accessor :config

    def load!
      SCHEMA.types.each do |type_schema|
        options = type_schema.options
        klass = Factory.type(type_schema)
        name = options[:type]

        AppStoreConnect::Type.const_set(name, klass)
      end
    end
  end

  load!
end
