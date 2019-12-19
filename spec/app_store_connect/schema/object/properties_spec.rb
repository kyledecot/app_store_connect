# frozen_string_literal: true

RSpec.describe AppStoreConnect::Schema::Object::Properties do
  describe '#[]' do
    let(:key) { :name }
    let(:schema) { { key => {} } }

    context 'when key exists' do
      subject { described_class.new(schema)[key] }

      it { is_expected.to be_an_instance_of(AppStoreConnect::Schema::Object::Property) }
    end
  end
end
