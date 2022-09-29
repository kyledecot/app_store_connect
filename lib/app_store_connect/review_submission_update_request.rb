# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  class ReviewSubmissionUpdateRequest < CreateRequest
    data do
      type 'reviewSubmissions'

      attributes do
        property :canceled
        property :submitted
      end
    end
  end
end
