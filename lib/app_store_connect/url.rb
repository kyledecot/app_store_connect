# frozen_string_literal: true

module AppStoreConnect
  class URL
    def initialize(path, **kwargs)
      @path = path
      @kwargs = kwargs
    end

    def host
      'api.appstoreconnect.apple.com'
    end

    def port
      443
    end

    def uri
      @uri ||= URI(
        "https://#{host}#{@path}"
        .gsub(/(\{(\w+)\})/) { @kwargs.fetch(Regexp.last_match(2).to_sym) }
      )

      @uri
    end

    def to_s
      uri.to_s
    end
  end
end
