# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  class BetaBuildLocalizationCreateRequest < CreateRequest
    data do
      type 'betaBuildLocalizations'

      attributes do
        property :locale, required: true
        property :whatsNew
      end
    end
  end
end
