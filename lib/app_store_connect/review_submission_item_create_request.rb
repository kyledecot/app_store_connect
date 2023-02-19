# frozen_string_literal: true

module AppStoreConnect
  class ReviewSubmissionItemCreateRequest < Request::Body::Create
    data do
      type 'reviewSubmissionItems'
    end
  end
end
