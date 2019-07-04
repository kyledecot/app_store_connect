# frozen_string_literal: true

module AppStoreConnect
  module Config
    API = JSON.parse(
      File.read(
        File.join(__dir__, '../config/api.json')
      )
    )
  end
end
