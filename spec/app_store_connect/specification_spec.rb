# frozen_string_literal: true

require 'tempfile'

RSpec.describe AppStoreConnect::Specification do
  around do |example|
    WebMock.allow_net_connect!
    example.call
    WebMock.disable_net_connect!
  end

  describe '#find' do
    it do
      Tempfile.open(['specification-', '.zip']) do |file|
        described_class.download(file.path)

        data = described_class.read(file.path)
        specification = described_class.new(data)

        actual = specification.find('v1', 'bundleIds')

        expect(actual).to be_a(Hash)
      end
    end
  end

  describe '.read' do
    it do
      Tempfile.open(['specification-', '.zip']) do |file|
        described_class.download(file.path)

        actual = described_class.read(file.path)

        expect(actual.key?('openapi')).to be(true)
      end
    end
  end

  describe '#component_schema' do
    it do
      Tempfile.open(['specification-', '.zip']) do |file|
        described_class.download(file.path)

        specification = described_class.new(described_class.read(file.path))
        ref = '#/components/schemas/BundleIdCreateRequest'

        actual = specification.component_schema(ref)

        expect(actual).to be_a(described_class::Component::Schema)
      end
    end
  end

  describe '#create_request_schema_ref' do
    it do
      Tempfile.open(['specification-', '.zip']) do |file|
        described_class.download(file.path)

        specification = described_class.new(described_class.read(file.path))

        actual = specification.create_request_schema_ref('v1', 'bundleIds')

        expect(actual).to eq('#/components/schemas/BundleIdCreateRequest')
      end
    end
  end

  describe '.download' do
    it 'returns the number of bytes written' do
      Tempfile.open(['specification-', '.zip']) do |file|
        actual = described_class.download(file.path)

        expect(actual).to be_a(Integer)
      end
    end
  end
end
