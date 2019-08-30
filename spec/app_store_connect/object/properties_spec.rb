RSpec.describe AppStoreConnect::Object::Properties do 
  describe '#names' do 
    let(:schema) { AppStoreConnect::SCHEMA.object!(type: 'UserInvitationCreateRequest') }
    let(:object) { described_class.new(**schema.options[:properties]) }
  
    context 'when recursive' do 
      let(:recursive) { true }

      it 'should return an array of names' do 
        expected_names = [:data, :attributes]
        actual_names = object.names(recursive)

        expect(actual_names).to match_array(expected_names)
      end 
    end 

    context 'when non-recursive' do 
      let(:recursive) { false }

      it 'should return an array of names' do 
        expected_names = [:data]
        actual_names = object.names(recursive)

        expect(actual_names).to match_array(expected_names)
      end 
    end 
  end  

  describe '#to_h' do 
    let(:schema) { AppStoreConnect::SCHEMA.object!(type: 'UserInvitationCreateRequest') }
    let(:object) { described_class.new(**schema.options[:properties]) }
    
    it 'should return a hash' do 
      expected_hash = { data: { attributes: {} } }
      actual_hash = object.to_h

      expect(actual_hash).to eq(expected_hash)
    end  
  end 
end 
