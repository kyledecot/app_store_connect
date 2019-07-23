# frozen_string_literal: true

# require'concurrent'

require 'app_store_connect/documentation/object'
require 'app_store_connect/documentation/type'
require 'app_store_connect/documentation/web_service_endpoint'
require 'app_store_connect/documentation/crawler'
require 'app_store_connect/documentation/pool'

module AppStoreConnect
  class Documentation
    ROOT_URI = URI.parse('https://developer.apple.com/documentation/appstoreconnectapi')

    attr_reader :seen

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
      @pool = Pool.new(size: 10)
      @semaphore = Mutex.new
    end

    def specifications
      @specifications ||= @documentation_by_type.values.flatten.map(&:to_specification)
    end

    def load!(base_uri = ROOT_URI)
      load(base_uri) do |page, &block|
        relevant(page.links).each do |link|
          next if visited?(link.uri)
          next if enqueued?(link.uri)

          load(link.uri, &block)
        end
      end

      loop do
        sleep(5)

        break if @pool.jobs.size.zero?
      end

      @pool.shutdown
    end

    def pages
      @pages ||= Set.new
    end

    def uris
      synchronize { pages.map(&:uri).to_set }
    end

    def paths
      uris.map(&:path).to_set
    end

    private

    def enqueued_uris
      @enqueued_uris ||= Set.new
    end

    def load(uri, &block)
      enqueued_uris << uri

      @pool.schedule(uri, &block)
    end

    def synchronize(&block)
      @semaphore.synchronize(&block)
    end

    def add(page)
      return page if visited?(page.uri)

      pages << page

      documentation = to_documentation(page)

      if documentation
        @documentation_by_type[documentation.class::TYPE] << documentation
        @on_documentation&.call(documentation)
      end

      page
    end

    def relevant(links)
      links.select do |link|
        link.uri.path.match?(%r{/documentation/appstoreconnect})
      end
    end

    def to_documentation(page)
      title = page.at('.topic-title .eyebrow')&.text.to_s
      type, = TYPES.to_a.find { |_, v| title.match?(v[:regexp]) }

      return nil if type.nil?

      TYPES[type][:class].new(page: page)
    end

    def visited?(uri)
      paths.include?(uri.path)
    end

    def enqueued?(uri)
      enqueued_uris.map(&:path).include?(uri.path)
    end
  end
end
