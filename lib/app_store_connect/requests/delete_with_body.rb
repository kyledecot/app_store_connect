# frozen_string_literal: true

module AppStoreConnect
  module Requests
    class DeleteWithBody < Net::HTTPRequest
      METHOD = 'DELETE'
      REQUEST_HAS_BODY = true
      RESPONSE_HAS_BODY = true
    end
  end
end
