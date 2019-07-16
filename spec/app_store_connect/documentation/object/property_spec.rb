# frozen_string_literal: true

RSpec.describe AppStoreConnect::Documentation::Object::Property do
  describe 'TYPE' do
    it 'should equal ":object_property"' do
      expect(described_class::TYPE).to eq(:object_property)
    end
  end
end
