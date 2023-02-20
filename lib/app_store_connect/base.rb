# frozen_string_literal: true

module AppStoreConnect
  class Base
    def initialize(**kwargs)
      @options = Client::Options.new(kwargs)
      @authorization = Client::Authorization.new(@options.slice(*Client::Authorization::OPTIONS))
    end

    # :nocov:
    def inspect
      "#<#{self.class.name}:#{object_id}>"
    end
    # :nocov:

    private

    def post(url, body, **kwargs)
      request = Request::Post.new(url, body, **kwargs)

      response = request.execute(headers)

      Client::Utils.decode(response.body, response.content_type)
    end

    def delete(url, **kwargs)
      request = Request::Delete.new(url, **kwargs)

      request.execute

      nil
    end

    def patch(url, body, **kwargs)
      request = Request::Patch.new(url, body, **kwargs)

      response = request.execute

      Client::Utils.decode(response.body, response.content_type)
    end

    def get(path, **kwargs)
      request = Request::Get.new(path, **kwargs)

      response = request.execute

      Client::Utils.decode(response.body, response.content_type)
    end

    def headers
      {
        'Authorization' => "Bearer #{@authorization.token}",
        'Content-Type' => 'application/json'
      }
    end
  end
end
