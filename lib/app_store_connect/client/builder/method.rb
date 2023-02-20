# frozen_string_literal: true

module AppStoreConnect
  class Client
    class Builder
      class Method
        TEMPLATE = <<~'SOURCE'
          <%= doc_block -%>
          def <%= @name -%>(**kwargs)
            <%= implementation %>
          end
        SOURCE

        def initialize(web_service_endpoint)
          @see = web_service_endpoint.delete(:see)
          @name = web_service_endpoint.delete(:alias)
          @http_body_type = web_service_endpoint.delete(:http_body_type)
          @web_service_endpoint = web_service_endpoint
        end

        def doc_block
          DocBlock.new(@see)
        end

        def path
          @web_service_endpoint[:path]
        end

        def http_method
          @web_service_endpoint[:http_method]
        end

        def to_s
          require 'erb'

          erb = ERB.new(TEMPLATE, trim_mode: '%-')

          erb.result(binding)
        end

        def implementation
          case http_method
          when 'delete' then Delete.new(path)
          when 'get' then Get.new(path)
          when 'patch' then Patch.new(path, @http_body_type)
          when 'post' then Post.new(path, @http_body_type)
          end
        end
      end
    end
  end
end
