# frozen_string_literal: true

require 'active_support/concern'

module AppStoreConnect
  module Object
    module Id
      extend ActiveSupport::Concern

      class_methods do
        def id(arg_name = :id)
          @include_id_in_body = true
          @id_arg_name = arg_name
        end
      end

      included do
        def id?
          self.class.instance_variable_get('@include_id_in_body')
        end

        def id_arg_name
          self.class.instance_variable_get('@id_arg_name')
        end
      end
    end
  end
end
