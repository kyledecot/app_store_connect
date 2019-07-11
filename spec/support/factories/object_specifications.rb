# frozen_string_literal: true

FactoryBot.define do
  factory :object_specification, class: AppStoreConnect::ObjectSpecification do
    skip_create

    name { 'BundleIdPlatform' }
    properties { {} }

    initialize_with do
      new(name: name, properties: properties)
    end
  end
end
