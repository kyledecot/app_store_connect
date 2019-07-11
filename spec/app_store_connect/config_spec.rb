# frozen_string_literal: true

RSpec.describe AppStoreConnect::Config do
  describe 'API' do
    subject { described_class::API }

    it { is_expected.to be_an_instance_of(Hash) }
    it { is_expected.to have_key('Object') }
  end
end
