# frozen_string_literal: true

module AppStoreConnect
  module Requests
    module V1
      module InAppPurchaseReviewScreenshot
        class Create < Request::Body
          data do
            type 'inAppPurchaseAppStoreReviewScreenshots'

            attributes do
              property :file_name, required: true
              property :file_size, required: true
            end
          end
        end
      end
    end
  end
end
