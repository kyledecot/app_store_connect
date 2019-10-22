# frozen_string_literal: true

module AppStoreConnect
  class Client
    class Utils
      CAMELIZE = ->(s) { s.to_s.camelize(:lower) }

      def self.encode(hash)
        hash
          .deep_transform_keys(&CAMELIZE)
          .to_json
      end
    end
  end
end
