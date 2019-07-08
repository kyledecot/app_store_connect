# frozen_string_literal: true

require "active_support/concern"

module AppStoreConnect
  module Object
    module Attributes
      extend ActiveSupport::Concern 

      class_methods do 
        def attributes(&block)
          self::Attributes.class_eval(&block)
        end 
      end 
      
      included do 
        attr_reader :attributes

        klass = Class.new do |attributes|
          include Object::Properties

          attributes.define_method :initialize do |**kwargs|
            self.class.properties.each do |name, options|
              raise ArgumentError, "#{name} required" if options[:required] && !kwargs[name]

              value = kwargs.fetch(name, options[:default])

              instance_variable_set("@#{name}", value)
            end
          end 

          def to_h 
            {}.tap do |hash|
              self.class.properties.keys.each do |name|
                value = instance_variable_get("@#{name}")

                hash[name] = value unless value.nil?
              end
            end
          end 
        end 

        const_set("Attributes", klass)
      end 
    end
  end
end
