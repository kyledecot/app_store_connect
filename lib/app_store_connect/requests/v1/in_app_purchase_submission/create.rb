# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  module Requests
    module V1
      module InAppPurchaseSubmission
        class Create < CreateRequest
          data do
            type 'inAppPurchaseSubmissions'
          end
        end
      end
    end
  end
end
