# frozen_string_literal: true

RSpec.describe AppStoreConnect::URL::Builder do
  let(:path) { '/v1/first/{first}/second/{second}' }
  let(:builder) { described_class.new(path, first: '1234', second: '5678') }

  describe '#to_s' do
    subject { builder.to_s }

    it { is_expected.to eq('https://api.appstoreconnect.apple.com/v1/first/1234/second/5678') }
  end
end
