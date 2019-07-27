# frozen_string_literal: true

require 'pry'

require 'app_store_connect/documentation/object'
require 'app_store_connect/documentation/type'
require 'app_store_connect/documentation/web_service_endpoint'
require 'app_store_connect/documentation/crawler'

module AppStoreConnect
  class Documentation
    def self.types
      @types ||= []
    end

    def self.register(klass)
      types << klass
    end

    def initialize(on_documentation: nil)
      @documentation_by_type = Hash.new { |h, k| h[k] = [] }
      @on_documentation = on_documentation
      @crawler = Crawler.new('https://developer.apple.com')
    end

    def load!
      @crawler.start('/documentation/appstoreconnectapi') do |document|
        documentation = to_documentation(document)

        unless documentation.nil?
          @documentation_by_type[documentation.type] << documentation
          @on_documentation&.call(documentation)
        end
      end
    end

    private

    def to_documentation(document)
      self.class.types.find do |type|
        next unless type.parsable?(document)

        break type.new(document: document)
      end
    end
  end
end
