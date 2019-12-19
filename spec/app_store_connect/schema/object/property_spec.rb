# frozen_string_literal: true

RSpec.describe AppStoreConnect::Schema::Object::Property do
  describe '#required?' do
    let(:property) { described_class.new(required: true) }

    context 'when true' do
      it 'should return true' do
        expect(property).to be_required
      end
    end

    context 'when false' do
      let(:property) { described_class.new(required: false) }

      it 'should return false' do
        expect(property).to_not be_required
      end
    end
  end

  describe '#type' do
    context 'when "uri-reference"' do
      let(:type) { 'uri-reference' }

      subject { described_class.new(type: 'uri-reference').type }

      it { is_expected.to be(URI) }
    end

    context 'when "integer"' do
      let(:type) { 'integer' }

      subject { described_class.new(type: 'integer').type }

      it { is_expected.to be(Integer) }
    end

    context 'when not supported' do
      it { expect { described_class.new(type: 'foobar').type }.to raise_error(described_class::UnsupportedType) }
    end
  end
end
