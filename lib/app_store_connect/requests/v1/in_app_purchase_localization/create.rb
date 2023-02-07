# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  module Requests
    module V1
      module InAppPurchaseLocalization
        class Create < CreateRequest
          data do
            type 'inAppPurchaseLocalizations'

            attributes do
              property :description
              property :locale, required: true
              property :name, required: true
            end
          end
        end
      end
    end
  end
end
