# frozen_string_literal: true

require 'app_store_connect/schema/object/properties'

module AppStoreConnect
  class Schema
    class Object
      attr_reader :type, :properties

      def initialize(options)
        @type = options.fetch(:type)
        @properties = Properties.new(options.fetch(:properties, []))
      end
    end
  end
end
