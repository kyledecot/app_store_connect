# frozen_string_literal: true

RSpec.shared_examples :post_request do |path:, body:|
  it do
    uri = "https://api.appstoreconnect.apple.com/v1/#{path}"

    expect(WebMock)
      .to have_requested(:post, uri)
      .with(body: body, headers: { content_type: 'application/json' })
  end
end
