require_relative "./data/attributes"
require_relative "./data/relationships" 

module AppStoreConnect
  class BetaGroupCreateRequest
    class Data 
      TYPE = "betaGroups"

      attr_reader :attributes, :relationships
      
      def initialize(*args)
        @attributes = Attributes.new # TODO 
        @relationships = Relationships.new # TODO 
      end 

      def to_hash 
        { 
          attributes: attributes.to_hash, 
          relationships: relationships.to_hash
        }
      end 
    end 
  end 
end 
