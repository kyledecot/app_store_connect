# frozen_string_literal: true

FactoryBot.define do
  factory :bundle_id_create_request, class: AppStoreConnect::BundleIdCreateRequest do
    skip_create

    transient do
      identifier { 'com.kyledecot.app' }
      platform { 'IOS' }
      name { 'Kyle Decot' }
      seed_id { nil }
    end

    trait :with_seed_id do
      seed_id { '1234' }
    end

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
