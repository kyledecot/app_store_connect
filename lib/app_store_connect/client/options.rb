# frozen_string_literal: true

require 'delegate'

module AppStoreConnect
  class Client
    class Options < SimpleDelegator
      attr_reader :kwargs, :config, :env

      DEFAULTS = {
        analytics_enabled: true,
        schema: Schema.new(File.join(__dir__, '..', '..', 'config', 'schema.json'))
      }.freeze
      private_constant :DEFAULTS

      ENV_REGEXP = /APP_STORE_CONNECT_(?<suffix>[A-Z_]+)/.freeze
      private_constant :ENV_REGEXP

      def initialize(kwargs = {})
        @kwargs = kwargs
        @config = build_config
        @env = build_env

        options = DEFAULTS.merge(@env.merge(@config.merge(kwargs)))

        super(options)
      end

      private

      def build_config
        AppStoreConnect.config.dup
      end

      def build_env
        {}.tap do |hash|
          ENV.each do |key, value|
            match = key.match(ENV_REGEXP)

            next unless match

            hash[match[:suffix].downcase.to_sym] = value
          end
        end
      end
    end
  end
end
