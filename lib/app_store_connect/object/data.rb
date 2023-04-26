# frozen_string_literal: true

require 'active_support/concern'

module AppStoreConnect
  module Object
    module Data
      extend ActiveSupport::Concern

      included do
        attr_reader :data

        klass = Class.new do |data|
          include Object::DataType
          include Object::Attributes
          include Object::Type
          include Object::Id

          data.send(:define_method, :initialize) do |**kwargs|
            instance_variable_set('@relationships', kwargs.delete(:relationships).to_h)
            instance_variable_set('@data', Array(kwargs.delete(:data)))
            instance_variable_set('@attributes', data::Attributes.new(**kwargs))
            instance_variable_set('@id', kwargs[id_arg_name])
          end

          def to_h
            props = {
              relationships: @relationships,
              attributes: attributes.to_h,
              type: type
            }
            props[:id] = @id if id?
            props.reject { |_k, v| v.blank? }
          end

          def to_a
            @data.each do |item|
              item[:type] = type
            end
            @data
          end

          def to_data_type
            if data_type == Array
              to_a
            else
              to_h
            end
          end
        end

        const_set('Data', klass)
      end

      class_methods do
        def data(type = Hash, &block)
          self::Data.data_type = type
          self::Data.class_eval(&block)
        end
      end
    end
  end
end
