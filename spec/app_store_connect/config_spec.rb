RSpec.describe AppStoreConnect::Config do 
  describe 'API' do 
    it 'should return a hash' do 
      expect(described_class::API).to be_an_instance_of(Hash)
    end 
  end 
end
