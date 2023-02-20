module AppStoreConnect
  class Response
    class Post
      def initialize(response)
        @response = response
      end

      def body
        @response.body
      end

      def content_type
        @response.content_type
      end
    end
  end
end