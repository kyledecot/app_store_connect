require_relative "./profile_create_request/data"

module AppStoreConnect
  class ProfileCreateRequest
    attr_reader :data

    def initialize(*args)
      @data = Data.new(*args)
    end

    def to_h 
      { data: data.to_h } 
    end 
  end 
end 
