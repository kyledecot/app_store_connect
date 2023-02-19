# frozen_string_literal: true

require 'net/http'

module AppStoreConnect
  class Specification
    def initialize(hash)
      @hash = hash
    end

    def find(version, type)
      @hash['paths'].find do |path, _declaration|
        path == "/#{version}/#{type}"
      end&.[](-1)
    end

    def self.read(path)
      require 'zip'

      Zip::File.open(path) do |zip_file|
        entry, = zip_file.entries
        content = entry.get_input_stream { |io| content = io.read }

        JSON.parse(content)
      end
    end

    def self.download(path)
      uri = URI('https://developer.apple.com/sample-code/app-store-connect/app-store-connect-openapi-specification.zip')

      Net::HTTP.start(uri.host, uri.port, { use_ssl: true }) do |http|
        response = http.get(uri.path)

        File.write(path, response.body)
      end
    end
  end
end
