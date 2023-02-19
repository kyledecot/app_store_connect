# frozen_string_literal: true

module AppStoreConnect
  class ReviewSubmissionCreateRequest < Request::Body::Create
    data do
      type 'reviewSubmissions'

      attributes do
        property :platform, required: true
      end
    end
  end
end
