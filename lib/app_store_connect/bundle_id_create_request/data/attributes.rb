# frozen_string_literal: true

module AppStoreConnect
  class BundleIdCreateRequest
    class Data
      class Attributes
        include Object::Attributes

        property :identifier, required: true
        property :name, required: true
        property :platform, required: true, type: 'BundleIdPlatform'
        property :seed_id
      end
    end
  end
end
