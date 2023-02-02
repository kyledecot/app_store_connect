# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  class ReviewSubmissionCreateRequest < CreateRequest
    data do
      type 'reviewSubmissions'

      attributes do
        property :platform, required: true
      end
    end
  end
end
