module AppStoreConnect
  class BundleIdCreateRequest 
    class Data 
      class Attributes
        attr_accessor :identifier, :name, :platform, :seed_id
        
        def initialize(identifier:, name:, platform:, seed_id:)
          self.identifier = identifier
          self.name = name
          self.platform = platform
          self.seed_id = seed_id
        end 
        
        def to_hash
          {
            identifier: identifier,
            name: name, 
            platform: platform,
            seed_id: seed_id
          }
        end 
      end 
    end 
  end 
end 
