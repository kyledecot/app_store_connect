# frozen_string_literal: true

RSpec.describe AppStoreConnect::Object do
  describe '.property_names' do
    let(:klass) do
      Class.new(described_class) do
        property :string, {}
        property :array, 'array' => true
      end
    end

    it 'should return an array' do
      expect(klass.property_names).to match_array(%i[string array])
    end
  end

  describe '#to_h' do
    it 'should return a hash' do
      klass = Class.new(described_class) do
        property :string, {}
        property :array, 'array' => true
      end

      object = klass.new(string: 'foo')

      expect(object.to_h).to eq(
        string: 'foo',
        array: []
      )
    end
  end
end
