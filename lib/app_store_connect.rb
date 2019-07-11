# frozen_string_literal: true

require 'jwt'
require 'httparty'

require 'app_store_connect/object'
require 'app_store_connect/authorization'
require 'app_store_connect/parser'
require 'app_store_connect/object_specification'
require 'app_store_connect/dependency_graph'
require 'app_store_connect/client'
require 'app_store_connect/version'
require 'app_store_connect/config'
require 'app_store_connect/factory'
require 'app_store_connect/factory/builder/object'

module AppStoreConnect
  Factory.register(:object, Factory::Builder::Object)

  Parser.parse!(Config::API)
end
