# frozen_string_literal: true

module AppStoreConnect
  class DocumentationPage
    def initialize(page:)
      @page = page
    end

    def type?
      @page.at('.topic-title .eyebrow')&.text == 'Type'
    end

    def object?
      @page.at('.topic-title .eyebrow')&.text == 'Object'
    end

    def web_service_endpoint?
      @page.at('.topic-title .eyebrow')&.text == 'Web Service Endpoint'
    end
  end
end
