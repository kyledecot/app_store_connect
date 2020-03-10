# frozen_string_literal: true

require 'bundler/setup'
require 'webmock/rspec'
require 'factory_bot'
require 'simplecov'
require 'timecop'
require 'pry'

SimpleCov.start do
  add_filter('/spec/')
end

require 'app_store_connect'

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions

    WebMock.disable_net_connect!(
      allow: %r{(latest/meta-data/iam/security-credentials/|https://pinpoint.us-east-1.amazonaws.com/v1/apps/649e0e23f7a249739d954a93d119af45/events|https://cognito-identity.us-east-1.amazonaws.com/|/latest/api/token)$}
    )
  end

  config.before(:each) do
    AppStoreConnect.config[:usage_enabled] = false

    stub_request(:post, 'https://api.mixpanel.com/track')
    stub_request(:any, /api.appstoreconnect.apple.com/).to_return(body: '{}')
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
