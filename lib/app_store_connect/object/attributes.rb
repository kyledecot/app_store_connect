module AppStoreConnect
  module Object 
    module Attributes 
      def self.included(base)
        base.include Properties 
      end 
      
      def initialize(**kwargs)
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
  end 
end 
