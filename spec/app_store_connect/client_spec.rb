# frozen_string_literal: true

RSpec.describe AppStoreConnect::Client do
  let(:private_key) { File.read(File.join(__dir__, '../support/fixtures/private_key.pem')) }
  let(:key_id) { 'M3225B466N' }
  let(:issuer_id) { '69a6de70-03db-47e3-e053-5b8c7c11a4d1' }

  subject(:client) do
    described_class.new(
      issuer_id: issuer_id,
      key_id: key_id,
      private_key: private_key
    )
  end

  describe '#users' do
    before { client.users }

    it_behaves_like :get_request, path: 'users', query_params: { limit: 200 }
  end

  describe '.app' do
    let(:id) { '1234' }

    before { subject.app(id) }

    it_behaves_like :get_request, path: 'apps/1234'
  end

  describe '.builds' do
    let(:id) { '1234' }

    before { subject.builds(id) }

    it_behaves_like :get_request, path: 'apps/1234/builds'
  end

  describe '.build' do
    let(:app_id) { '1234' }
    let(:build_id) { '5678' }

    before { subject.build(app_id, build_id) }

    it_behaves_like :get_request, path: 'apps/1234/builds/5678'
  end

  describe '.apps' do
    before do
      subject.apps
    end

    it_behaves_like :get_request, path: 'apps'
  end

  describe '#create_bundle_id' do
    before do
      subject.create_bundle_id(
        identifier: 'com.kyledecot.app',
        name: 'Kyle Decot',
        platform: 'IOS'
      )
    end

    it_behaves_like :post_request,
                    path: 'bundleIds',
                    body: {
                      'data' => {
                        'type' => 'bundleIds',
                        'attributes' => {
                          'identifier' => 'com.kyledecot.app',
                          'name' => 'Kyle Decot',
                          'platform' => 'IOS',
                          'seedId' => nil
                        }
                      }
                    }
  end

  describe '#create_user_invitation' do
    before do
      subject.create_user_invitation(
        first_name: 'Kyle',
        last_name: 'Decot',
        email: 'kyle.decot@icloud.com',
        roles: ['DEVELOPER'],
        provisioning_allowed: true,
        all_apps_visible: true
      )
    end

    it_behaves_like :post_request,
                    path: 'userInvitations',
                    body: {
                      'data' => {
                        'type' => 'userInvitations',
                        'attributes' => {
                          'firstName' => 'Kyle',
                          'lastName' => 'Decot',
                          'email' => 'kyle.decot@icloud.com',
                          'roles' => ['DEVELOPER'],
                          'provisioningAllowed' => true,
                          'allAppsVisible' => true
                        }
                      }
                    }
  end
end
