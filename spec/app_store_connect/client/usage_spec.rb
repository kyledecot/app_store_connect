# frozen_string_literal: true

RSpec.describe AppStoreConnect::Client::Usage do
  describe '#track' do
    it 'should track usage w/ mixpanel' do
      expect_any_instance_of(Mixpanel::Tracker)
        .to receive(:track)
        .with(String, 'usage')

      described_class.new.track
    end
  end
end
