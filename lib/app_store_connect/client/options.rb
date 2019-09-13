# frozen_string_literal: true

require 'delegate'

module AppStoreConnect
  class Client
    class Options < SimpleDelegator
      attr_reader :kwargs, :config, :env

      ENV_REGEXP = /APP_STORE_CONNECT_(?<name>[A-Z_]+)/.freeze
      private_constant :ENV_REGEXP

      def initialize(kwargs)
        @kwargs = kwargs
        @config = AppStoreConnect.config.dup
        @env = {}.tap do |hash|
          ENV.each do |key, value|
            match = key.match(ENV_REGEXP)

            next unless match

            hash[match[:name].downcase.to_sym] = value
          end
        end

        options = @config.merge(kwargs.merge(@env))

        %i[key_id issuer_id private_key].each do |key|
          raise ArgumentError, "missing #{key}" unless options.keys.include?(key)
        end

        super(options)
      end
    end
  end
end
