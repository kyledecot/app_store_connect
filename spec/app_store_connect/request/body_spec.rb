# frozen_string_literal: true

RSpec.describe AppStoreConnect::Request::Body do
  let(:klass) do
    Class.new(described_class) do
      include AppStoreConnect::Object::Data
      include AppStoreConnect::Object::Included

      data do
        attributes do
          property :bar
        end
      end
    end
  end

  let(:instance) { klass.new(included: [{ type: :foo }], bar: :baz) }

  subject { instance.to_h }

  describe '#to_h' do
    it { is_expected.to eq({ included: [{ type: :foo }], data: { attributes: { bar: :baz } } }) }
  end
end
