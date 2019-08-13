# frozen_string_literal: true

RSpec.shared_examples :get_request do |path:, query_parameters: nil|
  it do
    uri = "https://api.appstoreconnect.apple.com/v1/#{path}"

    uri += "?#{query_parameters.to_query}" if query_parameters

    expect(WebMock).to have_requested(:get, uri)
  end
end
