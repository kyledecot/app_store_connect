# frozen_string_literal: true

module AppStoreConnect
  class BundleIdCreateRequest < CreateRequest
    include Object::Data 
    
    data do 
      type "bundleIds"

      attributes do
        property :identifier, required: true
        property :name, required: true
        property :platform, required: true, type: 'BundleIdPlatform'
        property :seed_id
      end
    end 
  end
end
