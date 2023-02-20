# frozen_string_literal: true

module AppStoreConnect
  class Client
    class Builder
      class Method
        class Patch
          TEMPLATE = <<~'SOURCE'
            path = '<%= @path %>'
            url = URL.new(path, **kwargs)
            body = <%= @body -%>.new(**kwargs)

              patch(url, body)
          SOURCE

          def initialize(path, body)
            @path = path
            @body = body
          end

          def to_s
            require 'erb'

            erb = ERB.new(TEMPLATE, trim_mode: '%-')

            erb.result(binding)
          end
        end
      end
    end
  end
end
