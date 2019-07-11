# frozen_string_literal: true

RSpec.describe AppStoreConnect::ObjectSpecification do
  describe '#==' do
    context 'when the name is equal' do
      it 'should return true' do
        spec1 = create(:object_specification, name: 'Foo')
        spec2 = create(:object_specification, name: 'Foo')

        expect(spec1 == spec2).to be(true)
      end
    end

    context 'when the name is not equal' do
      it 'should return false' do
        spec1 = create(:object_specification, name: 'Foo')
        spec2 = create(:object_specification, name: 'Bar')

        expect(spec1 == spec2).to be(false)
      end
    end
  end

  describe '#eql?' do
    context 'when the name is equal' do
      it 'should return true' do
        spec1 = create(:object_specification, name: 'Foo')
        spec2 = create(:object_specification, name: 'Foo')

        expect(spec1).to eq(spec2)
      end
    end

    context 'when the name is not equal' do
      it 'should return false' do
        spec1 = create(:object_specification, name: 'Foo')
        spec2 = create(:object_specification, name: 'Bar')

        expect(spec1).to_not eq(spec2)
      end
    end
  end
end
