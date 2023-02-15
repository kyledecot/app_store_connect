# frozen_string_literal: true

require 'active_support/concern'

module AppStoreConnect
  module Object
    module Included
      extend ActiveSupport::Concern

      included do
        attr_reader :included

        klass = Class.new do |i|
          i.send(:define_method, :initialize) do |objects|
            instance_variable_set('@objects', [*objects])
          end

          def to_a
            @objects
          end
        end

        const_set('Included', klass)
      end
    end
  end
end
