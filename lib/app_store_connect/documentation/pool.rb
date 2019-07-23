# frozen_string_literal: true

module AppStoreConnect
  class Pool
    attr_reader :jobs

    def initialize(size:)
      @size = size
      @jobs = Queue.new

      @pool = Array.new(size) do |i|
        Thread.new do
          Thread.current[:id] = i

          catch(:exit) do
            loop do
              job, uri = @jobs.pop
              page = crawler.get(uri)
              job.call(page, &job)
            end
          end
        end
      end

      def crawler
        @crawler ||= Crawler.new
      end

      def schedule(uri, &block)
        @jobs << [block, uri]
      end

      def shutdown
        @size.times do
          schedule(nil) { throw :exit }
        end

        @pool.map(&:join)
      end
    end
  end
end
