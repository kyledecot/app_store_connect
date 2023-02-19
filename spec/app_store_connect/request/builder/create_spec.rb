# frozen_string_literal: true

RSpec.describe AppStoreConnect::Request::Builder::Create do
  let(:create_request_builder) { described_class.new(type, properties) }

  describe '.from' do
    it do
      schema = AppStoreConnect::Specification::Component::Schema.new(
        {
          'type' => 'object',
          'required' => ['data'],
          'title' => 'BundleIdCreateRequest',
          'properties' => { 'data' => { 'properties' => { 'attributes' => { 'properties' => { 'identifier' => { 'type' => 'string' }, 'name' => { 'type' => 'string' }, 'platform' => { '$ref' => '#/components/schemas/BundleIdPlatform' }, 'seedId' => { 'type' => 'string' } }, 'required' => %w[identifier name platform], 'type' => 'object' }, 'type' => { 'enum' => ['bundleIds'], 'type' => 'string' } }, 'required' => %w[attributes type], 'type' => 'object' } }
        }
      )

      actual = described_class.from(schema)

      expect(actual).to be_a(described_class)
    end
  end

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
        class ReviewSubmissionCreateRequest < Request::Body::Create
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
        class BundleIdCreateRequest < Request::Body::Create
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
