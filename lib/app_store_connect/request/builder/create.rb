# frozen_string_literal: true

require 'active_support/inflector'

module AppStoreConnect
  class Request
    module Builder
      class Create
        TEMPLATE = <<~SOURCE
          require 'app_store_connect/create_request'

          class <%= name %>CreateRequest < CreateRequest
            data do
              type '<%= type %>'

              <%- if properties.any? -%>
              attributes do
                <%- properties.each do |property| -%>
                property :<%= property %>
                <%- end -%>
              end
              <%- end -%>
            end
          end
        SOURCE
        private_constant :TEMPLATE

        attr_reader :name, :type, :properties

        def initialize(type, properties, version = 'v1')
          @name = type.singularize.classify
          @name = name
          @type = type
          @properties = properties
          @version = version
        end

        def source
          @source ||= begin
            require 'erb'

            erb = ERB.new(TEMPLATE, { trim_mode: '%-' })

            erb.result(binding)
          end

          @source
        end

        def alias
          "create_#{@type.underscore.singularize}"
        end

        def url
          "https://api.appstoreconnect.apple.com/#{@version}/#{@type}"
        end

        def http_method
          'post'
        end
      end
    end
  end
end
