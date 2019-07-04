# frozen_string_literal: true

module AppStoreConnect
  class Factory
    module Builder
      class Enum
        def self.call(values:)
          Class.new do
            attr_reader :value

            const_set('VALUES', values)

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
    end
  end
end
