# frozen_string_literal: true

RSpec.describe AppStoreConnect::Factory do
  describe '.type' do
    it 'should return a class that inherits from AppStoreConnect::Type' do
      klass = described_class.type(values: [])

      expect(klass).to be < AppStoreConnect::Type::Enum
    end
  end
end
