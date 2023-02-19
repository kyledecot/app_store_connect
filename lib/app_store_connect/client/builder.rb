# frozen_string_literal: true

module AppStoreConnect
  class Client
    class Builder
      TEMPLATE = <<~'SOURCE'
        # frozen_string_literal: true

        # WARNING ABOUT GENERATED CODE
        #
        # This file is generated.
        #
        # WARNING ABOUT GENERATED CODE

        module AppStoreConnect
          class Client < Base
          end
        end
      SOURCE
      private_constant :TEMPLATE

      def write
        File.write('lib/app_store_connect/client.rb', source)
      end

      def source
        @source ||= begin
          require 'erb'

          erb = ERB.new(TEMPLATE, trim_mode: '%<>-')

          erb.result(binding)
        end

        @source
      end
    end
  end
end
