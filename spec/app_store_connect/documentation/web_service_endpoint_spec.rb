# frozen_string_literal: true

RSpec.describe AppStoreConnect::Documentation::WebServiceEndpoint do
  subject(:documentation) do
    WebMock.allow_net_connect!
    agent = Mechanize.new
    page = agent.get('https://developer.apple.com/documentation/appstoreconnectapi/register_a_new_bundle_id')

    WebMock.disallow_net_connect!

    described_class.new(page: page)
  end

  describe '#url' do
    it 'should return "https://api.appstoreconnect.apple.com/v1/bundleIds"' do
      expect(documentation.url).to eq('https://api.appstoreconnect.apple.com/v1/bundleIds')
    end
  end

  describe '#host' do
    it 'should return "https://api.appstoreconnect.apple.com"' do
      expect(documentation.host).to eq('https://api.appstoreconnect.apple.com')
    end
  end

  describe '#path' do
    it 'should return "/v1/bundleIds"' do
      expect(documentation.path).to eq('/v1/bundleIds')
    end
  end

  describe '#description' do
    it 'should equal "Register a new bundle ID for app development."' do
      expect(documentation.description).to eq('Register a new bundle ID for app development.')
    end
  end

  describe '#http_method' do
    it 'should return "POST"' do
      expect(documentation.http_method).to eq('GET')
    end
  end

  describe '#to_specification' do
    it 'should return a WebServiceEndpointSpecification' do
      expect(documentation.to_specification).to be_a(AppStoreConnect::WebServiceEndpointSpecification)
    end
  end

  describe '#to_terminal_table' do
    it 'should return a Terminal::Table' do
      expect(documentation.to_terminal_table).to be_a(Terminal::Table)
    end
  end
end
