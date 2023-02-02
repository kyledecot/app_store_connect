# frozen_string_literal: true

require 'app_store_connect/modify_request'

module AppStoreConnect
  class BetaBuildLocalizationModifyRequest < ModifyRequest
    data do
      type 'betaBuildLocalizations'

      attributes do
        property :whats_new
      end
    end
  end
end
