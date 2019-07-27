# frozen_string_literal: true

module AppStoreConnect
  class Documentation
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
                job, *args = @jobs.pop
                job.call(*args)
              end
            end
          end
        end
      end

      def schedule(*args, &block)
        @jobs << [block, *args]
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
