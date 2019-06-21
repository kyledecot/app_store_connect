require_relative './bundle_id/data'

module AppStoreConnect
  class ProfileCreateRequest
    class Data 
      class Relationships
        class BundleId
          attr_reader :data

          def initialize(id:)
            @data = Data.new(id: id)
          end

          def to_h 
            {
              data: data.to_h  
            }
          end 
        end 
      end 
    end 
  end 
end 
