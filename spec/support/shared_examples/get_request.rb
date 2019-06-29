# frozen_string_literal: true

RSpec.shared_examples :get_request do |path:|
  it { expect(WebMock).to have_requested(:get, "https://api.appstoreconnect.apple.com/v1/#{path}") }
end
