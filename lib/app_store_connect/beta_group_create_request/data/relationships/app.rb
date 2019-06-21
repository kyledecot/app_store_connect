require_relative "./app/data"

module AppStoreConnect
  class BetaGroupCreateRequest
    class Data 
      class Relationships
        class App 
          def initialize(*args) 
            @data = Data.new(*args)
          end
        end 
      end 
    end 
  end 
end 
