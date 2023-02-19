# frozen_string_literal: true

module AppStoreConnect
  module Requests
    module V2
      module InAppPurchase
        class Update < Request::Body
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
