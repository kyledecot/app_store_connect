# frozen_string_literal: true

require 'mechanize'

require 'app_store_connect/documentation/object'
require 'app_store_connect/documentation/type'
require 'app_store_connect/documentation/web_service_endpoint'

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

    class NotLoaded < StandardError
    end

    def self.agent
      @agent ||= Mechanize.new { |a| a.user_agent_alias = 'Mac Safari' }
    end

    def self.types
      @types ||= Hash.new { |h, k| h[k] = [] }
    end

    def self.seen
      @seen ||= []
    end

    def self.loaded?
      @loaded ||= false
    end

    def self.for(page:)
      title = page.at('.topic-title .eyebrow')&.text.to_s
      type, = TYPES.to_a.find { |_, v| title.match?(v[:regexp]) }

      return nil if type.nil?

      TYPES[type][:class].new(page: page)
    end

    def self.load!(current = ROOT_URI, &block)
      return if seen.size > 10

      get(current) do |page|
        documentation = self.for(page: page)

        if documentation
          types[documentation.class.type] << documentation
          block.call(documentation) if block_given?
        end

        page.links.each do |link|
          uri = URI.parse(link.href)

          next if seen?(link)
          next unless applicable?(link)

          seen << page.uri.path
          load!(uri.path, &block)
        end
      end

      @loaded = true
    end

    def self.of(type:)
      types[type]
    end

    private

    def self.applicable?(link)
      path = URI.parse(link.href).path

      path.match?(%r{/documentation/appstoreconnect})
    end

    def self.seen?(link)
      path = URI.parse(link.href).path

      seen.include?(path)
    end

    def self.get(path, &block)
      agent.get(path) do |page|
        block.call(page) if block_given?
      end
    end
  end
end
