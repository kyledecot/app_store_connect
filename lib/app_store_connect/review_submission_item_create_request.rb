# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  class ReviewSubmissionItemCreateRequest < CreateRequest
    data do
      type 'reviewSubmissionItems'
    end
  end
end
