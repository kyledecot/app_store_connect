# frozen_string_literal: true

RSpec.describe AppStoreConnect::UserInvitationCreateRequest::Data::Attributes do
  describe '#to_h' do
    let(:attributes) do
      described_class.new(
        first_name: 'Kyle',
        last_name: 'Decot',
        email: 'kyle.decot@icloud.com',
        roles: ['ADMIN'],
        all_apps_visible: true,
        provisioning_allowed: true
      )
    end

    it 'should return a hash' do
      expect(attributes.to_h).to eq(
        first_name: 'Kyle',
        last_name: 'Decot',
        email: 'kyle.decot@icloud.com',
        roles: ['ADMIN'],
        all_apps_visible: true,
        provisioning_allowed: true
      )
    end
  end
end
