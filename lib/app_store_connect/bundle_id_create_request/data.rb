require_relative "./data/attributes"

module AppStoreConnect
  class BundleIdCreateRequest
    class Data 
      TYPE = "bundleIds" 

      attr_reader :attributes

      def initialize(*args)
        @attributes = Attributes.new(*args)
      end 

      def type 
        TYPE
      end 

      def to_hash
        { 
          attributes: attributes.to_hash, 
          type: type 
        } 
      end 
    end
  end
end 
