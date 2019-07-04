# frozen_string_literal: true

RSpec.describe AppStoreConnect::Factory do
  describe '.type' do
    context 'when the type is not supported' do
      it 'should raise UnsupportedType' do
        expect do
          described_class.type(type: 'Foobar')
        end.to raise_error(described_class::UnsupportedType)
      end
    end

    context 'when the type is "enum"' do
      it 'should return a class that inherits from AppStoreConnect::Type::Enum' do
        klass = described_class.type(type: 'enum', values: [])

        expect(klass).to be < AppStoreConnect::Type::Enum
      end
    end
  end
end
