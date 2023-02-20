# frozen_string_literal: true

module AppStoreConnect
  class Request
    class Body
      def self.inherited(klass)
        super
        klass.include(Object::Data)
      end

      def initialize(**kwargs)
        @data = self.class::Data.new(**kwargs)
      end

      def to_json 
        Client::Utils.encode(self.to_h)
      end 
    end
  end
end
