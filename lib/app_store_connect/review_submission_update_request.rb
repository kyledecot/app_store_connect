# frozen_string_literal: true

module AppStoreConnect
  class ReviewSubmissionUpdateRequest < Request::Body
    data do
      id
      type 'reviewSubmissions'

      attributes do
        property :canceled
        property :submitted
      end
    end
  end
end
