# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AppStoreConnect::BundleIdCreateRequest do
  let(:bundle_id_create_request) { create(:bundle_id_create_request) }
  let(:attributes) { bundle_id_create_request.data.attributes }

  describe '.to_hash' do
    subject { bundle_id_create_request.to_hash }

    it do
      is_expected.to eq(
        data: {
          type: described_class::Data::TYPE,
          attributes: {
            identifier: attributes.identifier,
            name: attributes.name,
            seed_id: attributes.seed_id,
            platform: attributes.platform
          }
        }
      )
    end
  end
end
