# frozen_string_literal: true

module AppStoreConnect
  module Requests
    module V1
      module BuildBetaDetail
        class Update < Request::Body
          data do
            id
            type 'buildBetaDetails'

            attributes do
              property :auto_notify_enabled
            end
          end
        end
      end
    end
  end
end
