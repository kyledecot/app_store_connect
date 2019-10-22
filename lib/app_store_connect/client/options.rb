# frozen_string_literal: true

require 'delegate'
require 'inifile'

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
        @inifile = build_inifile

        options = DEFAULTS.merge(@inifile.merge(@env.merge(@config.merge(kwargs))))

        super(options)
      end

      private

      def build_inifile
        filename = File.expand_path(File.join('~', '.app_store_connect', 'credentials'))

        return {} unless File.exist?(filename)

        IniFile.new(filename: filename).to_h['default']&.to_h&.deep_symbolize_keys
      end

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
