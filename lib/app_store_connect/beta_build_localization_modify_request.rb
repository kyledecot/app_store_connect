# frozen_string_literal: true

module AppStoreConnect
  class BetaBuildLocalizationModifyRequest < Request::Body
    data do
      id
      type 'betaBuildLocalizations'

      attributes do
        property :whats_new
      end
    end
  end
end
