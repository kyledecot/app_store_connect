# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

require 'app_store_connect/documentation/pool'

module AppStoreConnect
  class Documentation
    class Crawler
      def initialize(host)
        @host = host
        @pool = Pool.new(size: 1)
        @semaphore = Mutex.new
      end

      def start(path, &block)
        uri = URI.parse("#{@host}#{path}")

        load(uri, &block)

        loop do
          sleep(5)

          break if @pool.jobs.size.zero?
        end

        @pool.shutdown
      end

      def enqueued?(uri)
        enqueued_uris.map(&:path).include?(uri.path)
      end

      def visited?(uri)
        paths.include?(uri.path)
      end

      private

      def relevant_uris(document)
        document
          .xpath('//a/@href')
          .map(&:value)
          .select { |href| href.match?(%r{/documentation\/appstoreconnectapi}) }
          .map { |href| URI.parse("#{@host}#{href}") }
      end

      def load(uri, &block)
        @pool.schedule do
          return if visited?(uri)
          return if enqueued?(uri)

          document = Nokogiri::HTML(URI.open(uri))

          yield document if block_given?

          relevant_uris(document).each do |relevant_uri|
            load(relevant_uri, &block)
          end
        end
      end

      def enqueued_uris
        @enqueued_uris ||= Set.new
      end

      def uris
        @semaphore.synchronize do
          @uris ||= []
        end
      end

      def paths
        uris.map(&:path).to_set
      end
    end
  end
end
