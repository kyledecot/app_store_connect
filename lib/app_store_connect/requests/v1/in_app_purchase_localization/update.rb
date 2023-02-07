# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  module Requests
    module V1
      module InAppPurchaseLocalization
        class Update < CreateRequest
          data do
            id
            type 'inAppPurchaseLocalizations'

            attributes do
              property :description
              property :name
            end
          end
        end
      end
    end
  end
end
