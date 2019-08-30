# frozen_string_literal: true

RSpec.describe AppStoreConnect::Schema::Object do
  let(:type) { 'App' }
  let(:schema) { described_class.new(type: type) }

  describe '#type' do
    it 'should return a string' do
      expect(schema.type).to eq(type)
    end
  end
end
