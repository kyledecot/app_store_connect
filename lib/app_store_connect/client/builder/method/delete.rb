# frozen_string_literal: true

module AppStoreConnect
  class Client
    class Builder
      class Method
        class Delete
          TEMPLATE = <<~'SOURCE'
            path = '<%= @url %>'
            url = URL.new(path, **kwargs)

            delete(url)
          SOURCE

          def initialize(url)
            @url = url
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
