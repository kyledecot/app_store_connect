require_relative "./certificates/data"

module AppStoreConnect
  class ProfileCreateRequest 
    class Data 
      class Relationships
        class Certificates
          attr_reader :data

          def initialize(ids:)
            @data = ids.map { |id| Data.new(id: id) }
          end 

          def to_h 
            { data: data.map(&:to_h) }
          end
        end 
      end 
    end 
  end 
end 
