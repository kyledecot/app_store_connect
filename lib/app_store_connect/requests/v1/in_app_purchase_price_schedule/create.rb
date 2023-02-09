# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  module Requests
    module V1
      module InAppPurchasePriceSchedule
        class Create < CreateRequest
          data do
            type 'inAppPurchasePriceSchedules'
          end
        end
      end
    end
  end
end
