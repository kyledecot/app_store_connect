# frozen_string_literal: true

require 'mechanize'

require 'app_store_connect/documentation/object'
require 'app_store_connect/documentation/type'
require 'app_store_connect/documentation/web_service_endpoint'

module AppStoreConnect
  class Documentation
    attr_accessor :objects, :types, :web_service_endpoints

    def initialize
      @seen = []
      @objects = []
      @types = []
      @web_service_endpoints = []
      @agent = Mechanize.new { |a| a.user_agent_alias = 'Mac Safari' }
    end

    def load!
      load('https://developer.apple.com/documentation/appstoreconnectapi')
    end

    private

    def add_object(page)
      @objects << Object.new(page: page)
    end

    def add_web_service_endpoint(page)
      @web_service_endpoints << WebServiceEndpoint.new(page: page)
    end

    def add_type(page)
      @types << Type.new(page: page)
    end

    def seen?(path)
      @seen.include?(path)
    end

    def load(current)
      @agent.get(current) do |page|
        documentation_page = DocumentationPage.new(page: page)

        page.links.each do |link|
          uri = URI.parse(link.href)

          next if seen?(uri.path)
          next unless uri.path.match?(%r{/documentation/appstoreconnect})

          @seen << uri.path

          if documentation_page.object?
            add_object(page)
          elsif documentation_page.type?
            add_type(page)
          elsif documentation_page.web_service_endpoint?
            add_web_service_endpoint(page)
          end

          load(uri.path)

          break if @seen.size > 20
        end
      end
    end
  end
end
