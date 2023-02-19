# frozen_string_literal: true

module AppStoreConnect
  class Request
    module Body
      module Create
        class BundleId < Request::Body::Create
          data do
            type 'bundleIds'

            attributes do
              property :identifier, required: true
              property :name, required: true
              property :platform, required: true
              property :seed_id
            end
          end
        end
      end
    end
  end
end
