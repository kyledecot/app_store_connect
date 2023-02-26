# frozen_string_literal: true

module AppStoreConnect
  class Request
    class Body
      def self.inherited(klass)
        super

        klass.include(Object::Included)
        klass.include(Object::Data)
      end

      def initialize(**kwargs)
        @included = self.class::Included.new([*kwargs.delete(:included)])
        @data = self.class::Data.new(**kwargs)
      end

      def to_h
        {
          data: data.to_h,
          included: included.to_a
        }
      end
    end
  end
end
