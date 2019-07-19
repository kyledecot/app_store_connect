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

    def initialize(on_documentation: nil)
      @documentation_by_type = Hash.new { |h, k| h[k] = [] }
      @on_documentation = on_documentation
    end

    def specifications
      @documentation_by_type.values.flatten.map(&:to_specification)
    end

    def agent
      @agent ||= Mechanize.new { |a| a.user_agent_alias = 'Mac Safari' }
    end

    def seen
      @seen ||= []
    end

    def loaded?
      @loaded ||= false
    end

    def for(page:)
      title = page.at('.topic-title .eyebrow')&.text.to_s
      type, = TYPES.to_a.find { |_, v| title.match?(v[:regexp]) }

      return nil if type.nil?

      TYPES[type][:class].new(page: page)
    end

    def load!(current = ROOT_URI)
      return if seen.size > 10

      agent.get(current) do |page|
        documentation = self.for(page: page)

        if documentation
          @documentation_by_type[documentation.class.type] << documentation
          @on_documentation&.call(documentation)
        end

        page.links.each do |link|
          uri = URI.parse(link.href)

          next if seen?(link)
          next unless applicable?(link)

          seen << page.uri.path
          load!(uri.path)
        end
      end

      @loaded = true
    end

    def of(type:)
      @documentation_by_type[type]
    end

    private

    def applicable?(link)
      path = URI.parse(link.href).path

      path.match?(%r{/documentation/appstoreconnect})
    end

    def seen?(link)
      path = URI.parse(link.href).path

      seen.include?(path)
    end
  end
end
