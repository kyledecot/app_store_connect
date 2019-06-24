# frozen_string_literal: true

module AppStoreConnect
  class CreateRequest
    attr_reader :data

    def initialize(*args)
      @data = Data.new(*args)
    end

    def to_h
      { data: data.to_h }
    end
  end
end
