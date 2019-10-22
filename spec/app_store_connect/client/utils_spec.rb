# frozen_string_literal: true

RSpec.describe AppStoreConnect::Client::Utils do
  describe '.encode' do
    it 'should camelize' do
      expect(described_class.encode(first_name: 'Kyle')).to eq('{"firstName":"Kyle"}')
    end
  end
end
