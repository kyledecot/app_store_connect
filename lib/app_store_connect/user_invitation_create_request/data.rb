require_relative './data/attributes'

module AppStoreConnect
  class UserInvitationCreateRequest
    class Data 
      attr_accessor :attributes 

      def initialize(*args)
        @attributes = Attributes.new(*args)
      end

      def to_h 
        { attributes: attributes.to_h } 
      end
    end 
  end 
end
