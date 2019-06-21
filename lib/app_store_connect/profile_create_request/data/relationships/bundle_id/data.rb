module AppStoreConnect
  class ProfileCreateRequest
    class Data 
      class Relationships
        class BundleId
          class Data
            TYPE = "bundleIds"

            attr_reader :type
            attr_accessor :id

            def initialize(id:)
              @id = id 
            end

            def type 
              TYPE
            end

            def to_h 
              {
                id: id,
                type: type
              }
            end 
          end 
        end 
      end 
    end 
  end 
end 
