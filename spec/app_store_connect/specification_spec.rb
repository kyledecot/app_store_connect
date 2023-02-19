# frozen_string_literal: true

require 'tempfile'

RSpec.describe AppStoreConnect::Specification do
  describe '.download' do
    let(:file) { Tempfile.new(['specification-', '.zip']) }

    around do |example|
      WebMock.allow_net_connect!
      example.call
      WebMock.disable_net_connect!
    end

    it 'returns the number of bytes written' do
      actual = described_class.download(file.path)

      expect(actual).to be_a(Integer)
    end
  end
end
