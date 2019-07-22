# frozen_string_literal: true


require 'app_store_connect/documentation/object'
require 'app_store_connect/documentation/type'
require 'app_store_connect/documentation/web_service_endpoint'
require 'app_store_connect/documentation/crawler'

module AppStoreConnect
  class Documentation
    ROOT_URI = URI.parse('https://developer.apple.com/documentation/appstoreconnectapi')

    TYPES = {
      type: {
        class: Type,
        regexp: /Type/
      },
      object: {
        class: Object,
        regexp: /Object/
      },
      web_service_endpoint: {
        class: WebServiceEndpoint,
        regexp: /Web Service Endpoint/
      }
    }.freeze

    def initialize(on_documentation: nil)
      @documentation_by_type = Hash.new { |h, k| h[k] = [] }
      @on_documentation = on_documentation
      @seen = []
    end

    def specifications
      @documentation_by_type.values.flatten.map(&:to_specification)
    end

    def load!(uri = ROOT_URI)
      @seen << uri.path

      return if @seen.size > 50

      page = crawler.get(uri)
      documentation = to_documentation(page)
      uris = unseen(relavant(page.links)).map(&:uri)

      add(documentation) if documentation

      uris.each { |u| load!(u) }
    end

    private

    def crawler
      @crawler ||= Crawler.new
    end

    def unseen(links)
      links.reject { |l| seen?(l) }
    end

    def relavant(links)
      links.select do |link|
        link.uri.path.match?(%r{/documentation/appstoreconnect})
      end
    end

    def add(documentation)
      @documentation_by_type[documentation.class::TYPE] << documentation
      @on_documentation&.call(documentation)
    end

    def to_documentation(page)
      title = page.at('.topic-title .eyebrow')&.text.to_s
      type, = TYPES.to_a.find { |_, v| title.match?(v[:regexp]) }

      return nil if type.nil?

      TYPES[type][:class].new(page: page)
    end

    def seen?(link)
      @seen.include?(link.uri.path)
    end
  end
end
