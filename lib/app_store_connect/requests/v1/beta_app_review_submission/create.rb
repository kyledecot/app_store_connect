# frozen_string_literal: true

module AppStoreConnect
  module Requests
    module V1
      module BetaAppReviewSubmission
        class Create < Request::Body
          data do
            type 'betaAppReviewSubmissions'
          end
        end
      end
    end
  end
end
