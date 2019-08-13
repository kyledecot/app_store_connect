# frozen_string_literal: true

module AppStoreConnect
  class WebServiceEndpoint
    def initialize(**options)
      @options = options
    end

    def http_method
      @options[:http_method].to_sym
    end

    def http_body_type
      @options[:http_body_type]
    end

    def url
      @options[:url]
    end
  end
end
