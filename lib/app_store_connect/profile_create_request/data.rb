require_relative "./data/attributes"
require_relative "./data/relationships"

module AppStoreConnect 
  class ProfileCreateRequest
    class Data
      TYPE = "profiles" 

      attr_reader :attributes, :relationships

      def initialize(name:, profile_type:, bundle_id:, certificate_ids:, device_ids: [])
        @attributes = Attributes.new(
          name: name, 
          profile_type: profile_type
        )
        @relationships = Relationships.new(
          bundle_id: bundle_id, 
          certificate_ids: certificate_ids, 
          device_ids: device_ids
        )
      end

      def type 
        TYPE
      end 

      def to_h 
        {
          attributes: attributes.to_h,
          relationships: relationships.to_h,
          type: type
        }
      end 
    end 
  end 
end 
