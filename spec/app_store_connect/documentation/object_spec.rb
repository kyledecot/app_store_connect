# frozen_string_literal: true

RSpec.describe AppStoreConnect::Documentation::Object do
  subject(:documentation) do
    WebMock.allow_net_connect!
    agent = Mechanize.new
    page = agent.get('https://developer.apple.com/documentation/appstoreconnectapi/bundleidcreaterequest')

    WebMock.disallow_net_connect!

    described_class.new(page: page)
  end

  describe '#name' do
    it 'should return "BundleIdCreateRequest"' do
      expect(documentation.name).to eq('BundleIdCreateRequest')
    end
  end

  describe '#to_terminal_table' do
    it 'should return a Terminal::Table' do
      expect(documentation.to_terminal_table).to be_a(Terminal::Table)
    end
  end

  describe '#to_specification' do
    it 'should return a AppStoreConnect::ObjectSpecification' do
      expect(documentation.to_specification).to be_a(AppStoreConnect::Specification::Object)
    end
  end

  describe '#properties' do
    it 'should return an Array' do
      expect(documentation.properties).to be_an(Array)
    end
  end
end
