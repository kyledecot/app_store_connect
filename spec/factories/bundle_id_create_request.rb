FactoryBot.define do 
  factory :bundle_id_create_request, :class => AppStoreConnect::BundleIdCreateRequest do 
    skip_create

    identifier { "com.kyledecot.app" }
    seed_id { "123" }
    platform { "IOS" }
    name { "Kyle Decot" }

    initialize_with do 
      AppStoreConnect::BundleIdCreateRequest.new(
        identifier: identifier, 
        seed_id: seed_id, 
        platform: platform, 
        name: name
      )
    end 
  end 
end 
