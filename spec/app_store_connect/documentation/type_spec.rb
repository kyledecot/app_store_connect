# frozen_string_literal: true

require 'mechanize'

RSpec.describe AppStoreConnect::Documentation::Type do
  subject(:documentation) do
    WebMock.allow_net_connect!
    agent = Mechanize.new
    page = agent.get('https://developer.apple.com/documentation/appstoreconnectapi/bundleidplatform')

    WebMock.disallow_net_connect!

    described_class.new(page: page)
  end

  describe '#type' do
    it 'should return "BundleIdPlatform"' do
      expect(documentation.type).to eq('BundleIdPlatform')
    end
  end

  describe '#to_specification' do
    it 'should return a TypeSpecification' do
      expect(documentation.to_specification).to be_a(AppStoreConnect::Specification::Type)
    end
  end

  describe '#to_terminal_table' do
    it 'should return a Terminal::Table' do
      expect(documentation.to_terminal_table).to be_a(Terminal::Table)
    end
  end
end
