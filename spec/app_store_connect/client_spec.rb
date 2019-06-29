# frozen_string_literal: true

RSpec.describe AppStoreConnect::Client do
  let(:private_key) { File.read(File.join(__dir__, '../fixtures/private_key.pem')) }
  let(:key_id) { 'M3225B466N' }
  let(:issuer_id) { '69a6de70-03db-47e3-e053-5b8c7c11a4d1' }

  subject(:client) do
    described_class.new(
      issuer_id: issuer_id,
      key_id: key_id,
      private_key: private_key
    )
  end

  describe '.apps' do
    before do
      subject.apps
    end

    it_behaves_like :get_request, path: 'apps'
  end
end
