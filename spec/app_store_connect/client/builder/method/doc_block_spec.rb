# frozen_string_literal: true

RSpec.describe AppStoreConnect::Client::Builder::Method::DocBlock do
  describe '#to_s' do
    it 'returns a string' do
      actual = described_class.new('https://www.example.com').to_s

      expect(actual).to eq(<<~EXPECTED)
        #
        # @see https://www.example.com
        #
      EXPECTED
    end
  end
end
