# frozen_string_literal: true

RSpec.describe AppStoreConnect::Specification::Component::Schema do
  let(:declaration) do
    {
      'type' => 'object',
      'required' => ['data'],
      'title' => 'BundleIdCreateRequest',
      'properties' => { 'data' => { 'properties' => { 'attributes' => { 'properties' => { 'identifier' => { 'type' => 'string' }, 'name' => { 'type' => 'string' }, 'platform' => { '$ref' => '#/components/schemas/BundleIdPlatform' }, 'seedId' => { 'type' => 'string' } }, 'required' => %w[identifier name platform], 'type' => 'object' }, 'type' => { 'enum' => ['bundleIds'], 'type' => 'string' } }, 'required' => %w[attributes type], 'type' => 'object' } }
    }
  end

  describe '#properties' do
    it 'returns a hash' do
      schema = described_class.new(declaration)

      expect(schema.properties).to be_a(Hash)
    end
  end

  describe '#required' do
    it 'returns an array' do
      schema = described_class.new(declaration)

      expect(schema.required).to eq(['data'])
    end
  end

  describe '#title' do
    it 'returns a string' do
      schema = described_class.new(declaration)

      expect(schema.title).to eq('BundleIdCreateRequest')
    end
  end
end
