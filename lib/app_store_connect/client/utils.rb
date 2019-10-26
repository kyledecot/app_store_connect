# frozen_string_literal: true

module AppStoreConnect
  class Client
    class Utils
      def self.encode(hash)
        hash
          .deep_transform_keys { |s| s.to_s.camelize(:lower) }
          .to_json
      end

      def self.decode(string)
        JSON
          .parse(string)
          .deep_transform_keys { |k| k.underscore.to_sym }
      end
    end
  end
end
