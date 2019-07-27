# frozen_string_literal: true

require 'jwt'
require 'httparty'

require 'app_store_connect/type'

require 'app_store_connect/specification'
require 'app_store_connect/documentation'

require 'app_store_connect/authorization'
require 'app_store_connect/parser'
require 'app_store_connect/client'
require 'app_store_connect/version'
require 'app_store_connect/config'
require 'app_store_connect/factory'

module AppStoreConnect
  Factory.register(:object, Factory::Builder::Object)
  Factory.register(:object_property, Factory::Builder::Object::Property)
  Factory.register(:type, Factory::Builder::Type)
  Factory.register(:web_service_endpoint, Factory::Builder::WebServiceEndpoint)

  Documentation.register(Documentation::Type)
  Documentation.register(Documentation::Object)
  Documentation.register(Documentation::WebServiceEndpoint)

  # Parser.parse!(Config::API)
end
