# frozen_string_literal: true

module AppStoreConnect
  module Type
    class Enum
      attr_reader :value

      def initialize(value:)
        @value = value
      end

      def self.const_missing(const)
        return const_set(const, new(value: const.to_s)) if const.to_s.in?(const_get('VALUES'))

        super(const)
      end
    end
  end
end
