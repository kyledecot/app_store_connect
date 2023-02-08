# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  module Requests
    module V1
      module InAppPurchaseReviewScreenshot
        class Create < CreateRequest
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
