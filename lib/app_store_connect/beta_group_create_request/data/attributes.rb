module AppStoreConnect
  class BetaGroupCreateRequest
    class Data
      ATTRIBUTES = [
        :name, 
        :public_link_enabled, 
        :public_link_limit, 
        :public_link_limit_enabled
      ]
     
      class Attributes < Struct.new(*ATTRIBUTES, keyword_init: true)
      end 
    end 
  end 
end 
