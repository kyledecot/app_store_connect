require_relative "./beta_group_create_request/data"

module AppStoreConnect
  class BetaGroupCreateRequest
    attr_reader :data 

    def initialize(*args)
      @data = Data.new(*args)
    end

    def to_hash 
      { data: @data.to_hash }
    end 
  end 
end 
