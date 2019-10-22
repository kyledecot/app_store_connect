# frozen_string_literal: true

RSpec.describe AppStoreConnect::Client::Usage do
  describe '#track' do
    let(:options) { { analytics_enabled: enabled } }

    subject { described_class.new(options) }

    context 'when enabled' do
      let(:enabled) { true }

      it 'should track usage' do
        expect_any_instance_of(Mixpanel::Tracker)
          .to receive(:track)
          .with(String, 'usage', version: AppStoreConnect::VERSION)

        subject.track
      end

      it 'should return true' do
        allow_any_instance_of(Mixpanel::Tracker)
          .to receive(:track)
          .with(String, 'usage', version: AppStoreConnect::VERSION)
          .and_return(true)

        expect(subject.track).to be(true)
      end
    end

    context 'when disabled' do
      let(:enabled) { false }

      it 'should not track usage' do
        expect_any_instance_of(Mixpanel::Tracker)
          .to_not receive(:track)

        subject.track
      end

      it 'should return false' do
        expect(subject.track).to be(false)
      end
    end
  end
end
