# frozen_string_literal: true

RSpec.describe AppStoreConnect::Factory::Builder::Object do
  describe '.call' do
    let(:specification) { create(:object_specification) }

    it 'should return a class' do
      expect(described_class.call(specification)).to be_an_instance_of(Class)
    end

    context 'when specification properties include "data"' do
      let(:specification) do
        create(:object_specification, options: { properties: {
                 'data' => {}
               } })
      end

      it 'should have a data accessor' do
        klass = described_class.call(specification)

        expect(klass.instance_methods).to include(:data)
      end
    end
  end
end
