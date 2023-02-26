# frozen_string_literal: true

module AppStoreConnect
  module Requests
    module V1
      module AppStoreVersionLocalization
        class Create < Request::Body
          data do
            type 'appStoreVersionLocalizations'

            attributes do
              property :description
              property :keywords
              property :locale, required: true
              property :marketing_url
              property :promotional_text
              property :support_url
              property :whats_new
            end
          end
        end
      end
    end
  end
end
