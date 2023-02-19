# frozen_string_literal: true

module AppStoreConnect
  module Requests
    module V1
      module InAppPurchaseLocalization
        class Create < Request::Body
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
