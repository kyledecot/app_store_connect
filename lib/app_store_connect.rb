# frozen_string_literal: true

require 'jwt'
require 'httparty'

require 'app_store_connect/authorization'
require 'app_store_connect/parser'
require 'app_store_connect/client'
require 'app_store_connect/cli'
require 'app_store_connect/bundle_id_create_request'
require 'app_store_connect/user_invitation_create_request'
require 'app_store_connect/version'
require 'app_store_connect/factory'
require 'app_store_connect/config'
require 'app_store_connect/object'
require 'app_store_connect/type'
require 'app_store_connect/type/enum'

module AppStoreConnect
  Parser.parse!(Config::API)
end
