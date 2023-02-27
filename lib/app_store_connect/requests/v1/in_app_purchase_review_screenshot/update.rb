# frozen_string_literal: true

module AppStoreConnect
  module Requests
    module V1
      module InAppPurchaseReviewScreenshot
        class Update < Request::Body
          data do
            id
            type 'inAppPurchaseAppStoreReviewScreenshots'

            attributes do
              property :uploaded
              property :source_file_checksum
            end
          end
        end
      end
    end
  end
end
