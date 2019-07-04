# frozen_string_literal: true

RSpec.describe AppStoreConnect::Factory do
  describe '.build' do
    context 'when the builder is not registered' do
      it 'should raise BuilderNotRegistered' do
        expect do
          described_class.build('foo')
        end.to raise_error(described_class::BuilderNotRegistered)
      end
    end

    context 'when "enum"' do
      it 'should return a class that inherits from AppStoreConnect::Type::Enum' do
        klass = described_class.build('enum', values: [])

        expect(klass).to be < AppStoreConnect::Type::Enum
      end
    end
  end
end
