# frozen_string_literal: true

RSpec.describe AppStoreConnect::Client::Builder::Method::Delete do
  describe '#to_s' do
    it 'returns a string' do
      actual = described_class.new('/v1/bundleIds/{id}').to_s

      expect(actual).to eq(<<~EXPECTED)
        url = URL.new('/v1/bundleIds/{id}', **kwargs)

        delete(url)
      EXPECTED
    end
  end
end
