# frozen_string_literal: true

RSpec.describe AppStoreConnect::Request::Body do
  describe '#to_h' do
    it do
      klass = Class.new(described_class) do
        include AppStoreConnect::Object::Data

        data do
          attributes do
            property :bar
          end
        end
      end
      instance = klass.new(included: [{ type: :foo }], bar: :baz)

      expect(instance.to_h).to eq({ data: { attributes: { bar: :baz } }, included: [{ type: :foo }] })
    end
  end
end
