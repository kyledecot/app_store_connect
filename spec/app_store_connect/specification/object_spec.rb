# frozen_string_literal: true

RSpec.describe AppStoreConnect::Specification::Object do
  describe '#==' do
    context 'when the name is equal' do
      it 'should return true' do
        spec_1 = described_class.new('Foo')
        spec_2 = described_class.new('Foo')

        expect(spec_1 == spec_2).to be(true)
      end
    end

    context 'when the name is not equal' do
      it 'should return false' do
        spec_1 = described_class.new('Foo')
        spec_2 = described_class.new('Bar')

        expect(spec_1 == spec_2).to be(false)
      end
    end
  end

  describe '#eql?' do
    context 'when the name is equal' do
      it 'should return true' do
        spec_1 = described_class.new('Foo')
        spec_2 = described_class.new('Foo')

        expect(spec_1).to eq(spec_2)
      end
    end

    context 'when the name is not equal' do
      it 'should return false' do
        spec_1 = described_class.new('Foo')
        spec_2 = described_class.new('Bar')

        expect(spec_1).to_not eq(spec_2)
      end
    end
  end
end
