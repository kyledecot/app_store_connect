module AppStoreConnect
  class ProfileCreateRequest 
    class Data 
      class Attributes 
        attr_reader :name, :profile_type

        def initialize(name:, profile_type:)
          @name = name
          @profile_type = profile_type
        end 

        def to_h 
          {
            name: name,
            profile_type: profile_type
          }
        end 
      end 
    end 
  end
end 
