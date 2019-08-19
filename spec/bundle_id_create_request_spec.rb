# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AppStoreConnect::BundleIdCreateRequest do
  describe '.to_h' do
    context 'without seed_id' do
      let(:bundle_id_create_request) { create(:bundle_id_create_request) }
      let(:attributes) { bundle_id_create_request.data.attributes }

      it 'should return a hash' do
        expect(bundle_id_create_request.to_h).to eq(
          data: {
            type: 'bundleIds',
            attributes: {
              identifier: attributes.identifier,
              name: attributes.name,
              platform: attributes.platform
            },
            relationships: {}
          }
        )
      end
    end

    context 'with seed_id' do
      let(:bundle_id_create_request) { create(:bundle_id_create_request, :with_seed_id) }
      let(:attributes) { bundle_id_create_request.data.attributes }

      it 'should return a hash' do
        expect(bundle_id_create_request.to_h).to eq(
          data: {
            type: 'bundleIds',
            attributes: {
              identifier: attributes.identifier,
              name: attributes.name,
              seed_id: attributes.seed_id,
              platform: attributes.platform
            },
            relationships: {}
          }
        )
      end
    end
  end
end
