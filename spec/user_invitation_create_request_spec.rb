RSpec.describe AppStoreConnect::UserInvitationCreateRequest do 
  describe '#to_h' do
    let(:request) { create(:user_invitation_create_request) }

    it 'should return a hash' do 
      expect(request.to_h).to eq({
        data: {
          attributes: {
            first_name: 'Kyle',
            last_name: 'Decot', 
            email: 'kyle.decot@icloud.com',
            roles: ['ADMIN'],
            all_apps_visible: true,
            provisioning_allowed: true
          }
        }
      })
    end
  end 
end
