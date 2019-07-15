# frozen_string_literal: true

require 'terminal-table'
require 'colorize'

require 'app_store_connect/specification/web_service_endpoint'

module AppStoreConnect
  class Documentation
    class WebServiceEndpoint
      def initialize(page:)
        @page = page
      end

      def type
        :web_service_endpoint
      end

      def url
        "#{host}#{path}"
      end

      def host
        @page.at('.endpointurl-host').text
      end

      def path
        @page.at('.endpointurl-path').text
      end

      def http_method
        @page.at('.endpointurl-method').text
      end

      def http_body
        # TODO
      end

      def description
        @description ||= @page.at('.topic-description').text
      end

      def response_codes
        @page.search('#response-codes .parametertable-row').map do |_element|
          {}
          # {
          # status_code: response_code_status_code(element),
          # status_phrase: response_code_status_reason_phrase(element),
          # type: response_code_status_type(element)
          # }
        end
      rescue StandardError => e
        require 'pry'
        binding.pry
      end

      def to_specification
        WebServiceEndpointSpecification.new(options: {}) # TODO
      end

      def to_terminal_table
        @to_terminal_table ||= begin
          Terminal::Table.new do |table|
            table.title = "Web Service Endpoint\n\n#{http_method}\n#{url.light_blue}\n\n#{description}"
            table.headings = %w[Code Phrase Type]
            table.rows = response_codes.map do |response_code|
              [
                response_code[:status_code],
                response_code[:status_phrase],
                response_code[:type]
              ]
            end
          end
        end
      end

      private

      def response_code_status_type(element)
        element.at('.parametertable-type').text
      end

      def response_code_status_reason_phrase(element)
        element.at('.parametertable-status .parametertable-status-reasonphrase').text
      end

      def response_code_status_code(element)
        status = element.at('.parametertable-status').text

        status.gsub(" #{response_code_status_reason_phrase(element)}", '')
      end
    end
  end
end
