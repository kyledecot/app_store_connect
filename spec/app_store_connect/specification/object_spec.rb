# frozen_string_literal: true

RSpec.describe AppStoreConnect::Specification::Object do
  describe '#==' do
    context 'when the name is equal' do
      it 'should return true' do
        spec1 = described_class.new(name: 'Foo')
        spec2 = described_class.new(name: 'Foo')

        expect(spec1 == spec2).to be(true)
      end
    end

    context 'when the name is not equal' do
      it 'should return false' do
        spec1 = described_class.new(name: 'Foo')
        spec2 = described_class.new(name: 'Bar')

        expect(spec1 == spec2).to be(false)
      end
    end
  end

  describe '#eql?' do
    context 'when the name is equal' do
      it 'should return true' do
        spec1 = described_class.new(name: 'Foo')
        spec2 = described_class.new(name: 'Foo')

        expect(spec1).to eq(spec2)
      end
    end

    context 'when the name is not equal' do
      it 'should return false' do
        spec1 = described_class.new(name: 'Foo')
        spec2 = described_class.new(name: 'Bar')

        expect(spec1).to_not eq(spec2)
      end
    end
  end
end
