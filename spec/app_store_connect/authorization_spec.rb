RSpec.describe AppStoreConnect::Authorization do 
  let(:private_key) { File.read(File.join(__dir__, '../fixtures/private_key.pem')) }
  let(:key_id) { 'M3225B466N' }
  let(:issuer_id) { '69a6de70-03db-47e3-e053-5b8c7c11a4d1' }

  subject(:authorization) do
    described_class.new(
      issuer_id: issuer_id,
      key_id: key_id,
      private_key: private_key
    )
  end

  describe "#payload" do
    around do |example|
      Timecop.freeze(Time.local(2019)) do 
        example.call
      end 
    end 

    it "returns correctly" do 
      expect(authorization.payload).to eq(
        aud: described_class::AUDIENCE,
        exp: 1546320000,
        iss: issuer_id 
      )
    end 
  end 
end 
