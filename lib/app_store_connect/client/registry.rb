# frozen_string_literal: true

require 'delegate'

module AppStoreConnect
  class Client
    class Registry < SimpleDelegator
      OPTIONS = %i[schema].freeze

      def initialize(options = {})
        super(options .fetch(:schema).web_service_endpoints.map { |s| [s.alias, s] }.to_h)
      end
    end
  end
end
