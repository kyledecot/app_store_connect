# frozen_string_literal: true

RSpec.describe AppStoreConnect::Schema::Object do
  let(:type) { 'ResourceLinks' }
  let(:properties) { [{ self: { type: 'uri-reference', required: true } }] }
  let(:schema) { { type: type, properties: properties } }

  subject { described_class.new(schema) }

  describe '#properties' do
    subject { described_class.new(schema).properties }

    it { is_expected.to be_an_instance_of(AppStoreConnect::Schema::Object::Properties) }
  end

  describe '#type' do
    subject { described_class.new(schema).type }

    it { is_expected.to eq(type) }
  end
end
