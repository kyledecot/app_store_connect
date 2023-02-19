# frozen_string_literal: true

module AppStoreConnect
  class BetaBuildLocalizationCreateRequest < Request::Body::Create
    data do
      type 'betaBuildLocalizations'

      attributes do
        property :locale, required: true
        property :whats_new
      end
    end
  end
end
