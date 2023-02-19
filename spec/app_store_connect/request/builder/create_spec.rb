# frozen_string_literal: true

RSpec.describe AppStoreConnect::Request::Builder::Create do
  let(:create_request_builder) { described_class.new(type, properties) }

  context 'with Review Submissions' do
    let(:type) { 'reviewSubmissions' }
    let(:properties) { %w[platform] }

    describe '#url' do
      subject { create_request_builder.url }

      it { is_expected.to eq('https://api.appstoreconnect.apple.com/v1/reviewSubmissions') }
    end

    describe '#alias' do
      subject { create_request_builder.alias }

      it { is_expected.to eq('create_review_submission') }
    end

    describe '#source' do
      subject { create_request_builder.source }

      it { is_expected.to eq(<<~EXPECTED) }
        require 'app_store_connect/create_request'

        class ReviewSubmissionCreateRequest < CreateRequest
          data do
            type 'reviewSubmissions'

            attributes do
              property :platform
            end
          end
        end
      EXPECTED
    end
  end

  context 'with Bundle IDs' do
    let(:type) { 'bundleIds' }
    let(:properties) { %w[name identifier platform seed_id] }

    describe '#url' do
      subject { create_request_builder.url }

      it { is_expected.to eq('https://api.appstoreconnect.apple.com/v1/bundleIds') }
    end

    describe '#alias' do
      subject { create_request_builder.alias }

      it { is_expected.to eq('create_bundle_id') }
    end

    describe '#source' do
      subject { create_request_builder.source }

      it { is_expected.to eq(<<~EXPECTED) }
        require 'app_store_connect/create_request'

        class BundleIdCreateRequest < CreateRequest
          data do
            type 'bundleIds'

            attributes do
              property :name
              property :identifier
              property :platform
              property :seed_id
            end
          end
        end
      EXPECTED
    end
  end
end
