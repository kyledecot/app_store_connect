# frozen_string_literal: true

require 'app_store_connect/create_request'

module AppStoreConnect
  class CertificateCreateRequest < CreateRequest
    data do
      type 'certificates'

      attributes do
        property :certificate_type, required: true
        property :csr_content, required: true
      end
    end
  end
end
