# frozen_string_literal: true

module AppStoreConnect
  class BundleIdCreateRequest
    class Data
      class Attributes
        attr_accessor :identifier, :name, :platform, :seed_id

        def initialize(identifier:, name:, platform:, seed_id: nil)
          self.identifier = identifier
          self.name = name
          self.platform = platform
          self.seed_id = seed_id
        end

        def to_hash
          {
            identifier: identifier,
            name: name,
            platform: platform
          }.tap do |hash|
            hash[:seed_id] = seed_id unless seed_id.nil?
          end 
        end
      end
    end
  end
end
