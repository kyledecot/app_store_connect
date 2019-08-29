# frozen_string_literal: true

require 'app_store_connect/client'
require 'app_store_connect/schema'
require 'app_store_connect/version'

module AppStoreConnect
  @config = {}

  SCHEMA = Schema.new(File.join(__dir__, './config/schema.json'))

  class << self
    attr_accessor :config
  end
end
