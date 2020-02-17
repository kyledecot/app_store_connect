# frozen_string_literal: true

module AppStoreConnect
  class Client
    class Utils
      def self.encode(hash)
        hash
          .deep_transform_keys { |s| s.to_s.camelize(:lower) }
          .to_json
      end

      # Right now this only supports gzip and json responses.
      # If you need to support a different type then add it.
      def self.decode(string, content_type = 'application/json')
        decoded_data = nil

        case content_type
        when 'application/a-gzip'
          sio = StringIO.new string
          gz = Zlib::GzipReader.new sio
          decoded_data = gz.read
        else # Assume JSON
          decoded_data = JSON
                         .parse(string)
                         .deep_transform_keys { |k| k.underscore.to_sym }
        end

        decoded_data
      end
    end
  end
end
