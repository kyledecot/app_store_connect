# frozen_string_literal: true

module AppStoreConnect
  class Client
    class Utils
      def self.encode(hash)
        hash
          .deep_transform_keys { |k| k.to_s.camelize(:lower) }
          .to_json
      end
    end
  end
end
