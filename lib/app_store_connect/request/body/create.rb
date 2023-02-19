# frozen_string_literal: true

module AppStoreConnect
  class Request
    module Body
      class Create
        def self.inherited(klass)
          super
          klass.include(Object::Data)
        end

        def initialize(**kwargs)
          @data = self.class::Data.new(**kwargs)
        end
      end
    end
  end
end
