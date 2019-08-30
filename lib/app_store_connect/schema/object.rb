# frozen_string_literal: true

require 'app_store_connect/schema/object/properties'

module AppStoreConnect
  class Schema
    class Object
      attr_reader :options, :properties, :type

      def initialize(**options)
        @options = options
        @type = options.fetch(:type)
        @properties = Properties.new(options[:properties])
      end
    end
  end
end
