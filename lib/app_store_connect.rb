# frozen_string_literal: true

require 'jwt'

require 'app_store_connect/authorization'
require 'app_store_connect/parser'

require 'app_store_connect/schema'
require 'app_store_connect/object/type'
require 'app_store_connect/object/attributes'
require 'app_store_connect/object/properties'
require 'app_store_connect/object/data'
require 'app_store_connect/create_request'
require 'app_store_connect/client'
require 'app_store_connect/bundle_id_create_request'
require 'app_store_connect/device_create_request'
require 'app_store_connect/profile_create_request'
require 'app_store_connect/certificate_create_request'
require 'app_store_connect/user_invitation_create_request'
require 'app_store_connect/version'

require 'app_store_connect/type'
require 'app_store_connect/type/enum'

require 'app_store_connect/factory'
require 'app_store_connect/factory/builder/enum'

module AppStoreConnect
  Factory.register('enum', Factory::Builder::Enum)

  @config = {}

  SCHEMA = Schema.new(File.join(__dir__, './config/schema.json'))
  Parser.parse!(SCHEMA)

  class << self
    attr_reader :config

    attr_writer :config
  end
end
