# frozen_string_literal: true

FactoryBot.define do
  factory :object_specification, class: AppStoreConnect::Specification::Object do
    skip_create

    name { 'BundleIdPlatform' }
    options { { 'Properties' => {} } }

    initialize_with do
      new(name: name, options: options)
    end
  end
end
