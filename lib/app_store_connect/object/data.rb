require 'active_support/concern'

module AppStoreConnect
  module Object 
    module Data 
      extend ActiveSupport::Concern

      included do 
        attr_reader :data  

        klass = Class.new do |data| 
          include Object::Attributes 
          include Object::Type 
          
          data.define_method :initialize do |**kwargs|
            instance_variable_set("@attributes", data::Attributes.new(kwargs))
          end

          def to_h 
            { 
              attributes: attributes.to_h,
              type: type
            }
          end 
        end

        const_set("Data", klass)

        def to_h 
          { 
            data: data.to_h 
          }
        end 
      end 
      
      class_methods do 
        def data(&block)
          self::Data.class_eval(&block)
        end
      end 
    end 
  end 
end 
