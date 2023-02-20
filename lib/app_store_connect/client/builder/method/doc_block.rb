# frozen_string_literal: true

module AppStoreConnect
  class Client
    class Builder
      class Method
        class DocBlock
          TEMPLATE = <<~'SOURCE'
            #
            # @see <%= @see %>
            #
          SOURCE

          def initialize(see)
            @see = see
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
