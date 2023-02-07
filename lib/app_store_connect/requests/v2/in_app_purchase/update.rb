# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  module Requests
    module V2
      module InAppPurchase
        class Update < CreateRequest
          data do
            id
            type 'inAppPurchases'

            attributes do
              property :name
              property :available_in_all_territories
              property :family_sharable
              property :review_note
            end
          end
        end
      end
    end
  end
end
