# frozen_string_literal: true

RSpec.describe AppStoreConnect::Factory do
  describe '.build' do
    context 'when the builder is not registered' do
      it 'should raise BuilderNotRegistered' do
        expect do
          described_class.build('foo', nil)
        end.to raise_error(described_class::BuilderNotRegistered)
      end
    end
  end
end
