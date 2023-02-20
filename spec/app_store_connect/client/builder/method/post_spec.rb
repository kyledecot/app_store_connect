# frozen_string_literal: true

RSpec.describe AppStoreConnect::Client::Builder::Method::Post do
  describe '#to_s' do
    it 'returns a string' do
      actual = described_class.new('https://www.example.com', 'Request::Body::BundleId::Create').to_s

      expect(actual).to eq(<<~EXPECTED)
        uri = build_uri('https://www.example.com', **kwargs)
        body = Request::Body::BundleId::Create.new(**kwargs)

        post(uri, body)
      EXPECTED
    end
  end
end
