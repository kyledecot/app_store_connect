# frozen_string_literal: true

require 'mechanize'

require 'app_store_connect/documentation/object'
require 'app_store_connect/documentation/type'
require 'app_store_connect/documentation/web_service_endpoint'

module AppStoreConnect
  class Documentation
    ROOT_URL = 'https://developer.apple.com/documentation/appstoreconnectapi'

    attr_accessor :objects, :types, :web_service_endpoints

    def initialize(on_object: nil, on_type: nil, on_web_service_endpoint: nil)
      @on_web_service_endpoint = on_web_service_endpoint
      @on_object = on_object
      @on_type = on_type
      @seen = []
      @objects = []
      @types = []
      @web_service_endpoints = []
      @agent = Mechanize.new { |a| a.user_agent_alias = 'Mac Safari' }
    end

    def load!
      load(ROOT_URL)
    end

    private

    def applicable?(link)
      path = URI.parse(link.href).path

      path.match?(%r{/documentation/appstoreconnect})
    end

    def add_object(page)
      documentation = Object.new(page: page)

      @on_object&.call(documentation)

      @objects << documentation
    end

    def add_web_service_endpoint(page)
      documentation = WebServiceEndpoint.new(page: page)

      @on_web_service_endpoint&.call(documentation)

      @web_service_endpoints << documentation
    end

    def add_type(page)
      documentation = Type.new(page: page)

      @on_type&.call(documentation)

      @types << documentation
    end

    def seen?(link)
      path = URI.parse(link.href).path

      @seen.include?(path)
    end

    def get(path, &block)
      @agent.get(path) do |page|
        documentation_page = DocumentationPage.new(page: page)

        block.call(documentation_page) if block_given?
      end
    end

    def load(current)
      return if @seen.size > 20

      get(current) do |documentation_page|
        page.links.each do |link|
          uri = URI.parse(link.href)

          next if seen?(link)
          next unless applicable?(link)

          @seen << uri.path

          if documentation_page.object?
            add_object(page)
          elsif documentation_page.type?
            add_type(page)
          elsif documentation_page.web_service_endpoint?
            add_web_service_endpoint(page)
          end

          load(uri.path)
        end
      end
    end
  end
end
