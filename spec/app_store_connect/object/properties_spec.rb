# frozen_string_literal: true

RSpec.describe AppStoreConnect::Object::Properties do
  describe '.properties' do
    let(:klass) { Class.new { include AppStoreConnect::Object::Properties } }

    before do
      klass.property :name, required: true
      klass.property :description, {}
    end

    subject { klass.properties }

    it { is_expected.to eq(name: { required: true }, description: {}) }
  end
end
