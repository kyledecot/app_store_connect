# frozen_string_literal: true

require 'jwt'
require 'httparty'

require 'app_store_connect/type'

require 'app_store_connect/specification/web_service_endpoint'
require 'app_store_connect/specification/object'
require 'app_store_connect/specification/type'

require 'app_store_connect/documentation'

require 'app_store_connect/authorization'
require 'app_store_connect/parser'
require 'app_store_connect/dependency_graph'
require 'app_store_connect/client'
require 'app_store_connect/version'
require 'app_store_connect/config'
require 'app_store_connect/factory'

module AppStoreConnect
  Factory.register(:object, Factory::Builder::Object)
  Factory.register(:object_property, Factory::Builder::Object::Property)
  Factory.register(:type, Factory::Builder::Type)
  Factory.register(:web_service_endpoint, Factory::Builder::WebServiceEndpoint)

  Parser.parse!(Config::API)
end
