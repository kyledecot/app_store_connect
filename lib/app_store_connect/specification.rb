# frozen_string_literal: true

require 'net/http'

module AppStoreConnect
  class Specification
    def self.download(path)
      uri = URI('https://developer.apple.com/sample-code/app-store-connect/app-store-connect-openapi-specification.zip')

      Net::HTTP.start(uri.host, uri.port, { use_ssl: true }) do |http|
        response = http.get(uri.path)

        File.write(path, response.body)
      end
    end
  end
end
