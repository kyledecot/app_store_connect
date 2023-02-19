# frozen_string_literal: true

module AppStoreConnect
  class ReviewSubmissionItemCreateRequest < Request::Body
    data do
      type 'reviewSubmissionItems'
    end
  end
end
