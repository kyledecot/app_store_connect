# frozen_string_literal: true

module AppStoreConnect
  class Factory
    module Builder
      class WebServiceEndpoint
        def self.call(_specification)
          Class.new(AppStoreConnect::WebServiceEndpoint) do |base|
            # TODO
          end
        end
      end
    end
  end
end
