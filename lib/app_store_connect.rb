# frozen_string_literal: true

require 'jwt'
require 'httparty'

require 'app_store_connect/object'

require 'app_store_connect/object_specification'
require 'app_store_connect/property_specification'
require 'app_store_connect/type_specification'

require 'app_store_connect/documentation'
require 'app_store_connect/documentation_page'

require 'app_store_connect/authorization'
require 'app_store_connect/parser'
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
