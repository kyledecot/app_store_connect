# frozen_string_literal: true

require 'zeitwerk'
require 'active_support/all'

APP_STORE_CONNECT_LOADER = Zeitwerk::Loader.for_gem
APP_STORE_CONNECT_LOADER.setup

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
