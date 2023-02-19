# frozen_string_literal: true

require 'tempfile'

RSpec.describe AppStoreConnect::Specification do
  around do |example|
    WebMock.allow_net_connect!
    example.call
    WebMock.disable_net_connect!
  end

  describe '#find' do
    let(:file) { Tempfile.new(['specification-', '.zip']) }

    it do
      specification = described_class.new(described_class.read('./tmp/foo.zip'))

      actual = specification.find('v1', 'bundleIds')

      expect(actual).to be_a(Hash)
    end
  end

  describe '.read' do
    let(:file) { Tempfile.new(['specification-', '.zip']) }

    it do
      described_class.download(file.path)

      actual = described_class.read(file.path)

      expect(actual.key?('openapi')).to be(true)
    end
  end

  describe '#create_request_schema_ref' do
    let(:file) { Tempfile.new(['specification-', '.zip']) }

    it do
      specification = described_class.new(described_class.read('./tmp/foo.zip'))

      actual = specification.create_request_schema_ref('v1', 'bundleIds')

      expect(actual).to eq('#/components/schemas/BundleIdCreateRequest')
    end
  end

  describe '.download' do
    let(:file) { Tempfile.new(['specification-', '.zip']) }

    it 'returns the number of bytes written' do
      actual = described_class.download(file.path)

      expect(actual).to be_a(Integer)
    end
  end
end
