# frozen_string_literal: true

module AppStoreConnect
  class Factory
    module Builder
      class Object
        def self.call(specification)
          Class.new do |base|
            specification.properties.keys.map(&:to_sym).each do |sym|
              base.attr_reader sym
            end

            base.define_method :initialize do |**args|
              specification.properties.each do |name, options|
                value = if options['object']
                          "AppStoreConnect::#{options['object'].gsub('.', '::')}".constantize.new(**args)
                        else
                          args[name.to_sym]
                        end
                instance_variable_set("@#{name}", value)
              end
            end

            base.define_method :to_h do
              {}.tap do |hash|
                specification.properties.each do |name, options|
                  value = if options['object']
                            instance_variable_get("@#{name}").to_h
                          else
                            instance_variable_get("@#{name}")
                          end

                  hash[name.to_sym] = value
                end
              end
            end
          end
        end
      end
    end
  end
end
