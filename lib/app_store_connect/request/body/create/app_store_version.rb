# frozen_string_literal: true

module AppStoreConnect
  module Request
    module Body
      class Create
        class AppStoreVersion < Create
          data do
            type 'appStoreVersions'

            attributes do
              property :copyright
              property :earliest_release_date
              property :platform, required: true
              property :release_type
              property :version_string, required: true
            end
          end
        end
      end
    end
  end
end
