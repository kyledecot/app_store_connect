# frozen_string_literal: true

RSpec.describe AppStoreConnect::Schema::WebServiceEndpoint do
  let(:web_service_endpoint) { described_class.new(http_method: 'get') }

  describe '#http_method' do
    it 'should return a symbol' do
      expect(web_service_endpoint.http_method).to eq(:get)
    end
  end

  describe '#http_body_type' do
    context 'when HTTP method is GET' do
      let(:web_service_endpoint) do
        described_class.new(
          http_method: 'get'
        )
      end

      it 'should return nil' do
        expect(web_service_endpoint.http_body_type).to be_nil
      end
    end

    context 'when HTTP method is POST' do
      let(:web_service_endpoint) do
        described_class.new(
          http_method: 'post',
          http_body_type: 'UserInvitationCreateRequest'
        )
      end

      it 'should return a string' do
        expect(web_service_endpoint.http_body_type).to eq('UserInvitationCreateRequest')
      end
    end
  end
end
