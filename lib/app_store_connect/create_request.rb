module AppStoreConnect
  class CreateRequest 
    include Object::Data

    def initialize(**kwargs)
      @data = Data.new(kwargs)
    end 
  end 
end 
