# frozen_string_literal: true

module AppStoreConnect
  module Requests
    module V1
      module InAppPurchaseLocalization
        class Update < Request::Body
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
