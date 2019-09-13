# frozen_string_literal: true

RSpec.describe AppStoreConnect::Client::Usage do
  describe '#track' do
    let(:options) { { analytics_enabled: enabled } }

    context 'when enabled' do
      let(:enabled) { true }

      it 'should track usage' do
        expect_any_instance_of(Mixpanel::Tracker)
          .to receive(:track)
          .with(String, 'usage')

        described_class.new(options).track
      end
    end

    context 'when disabled' do
      let(:enabled) { false }

      it 'should not track usage' do
        expect_any_instance_of(Mixpanel::Tracker)
          .to_not receive(:track)

        described_class.new(options).track
      end
    end
  end
end
