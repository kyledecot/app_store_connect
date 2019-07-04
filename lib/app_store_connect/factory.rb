# frozen_string_literal: true

module AppStoreConnect
  class Factory
    UnsupportedType = Class.new(StandardError)

    TYPES = {
      'enum' => 'Enum'
    }.freeze

    def self.object(properties)
      Class.new(AppStoreConnect::Object, &configure_object(properties))
    end

    def self.type(type:, **options)
      case type
      when *TYPES.keys
        klass = "AppStoreConnect::Type::#{TYPES[type]}".constantize
        Class.new(klass, &send(type, options))
      else
        raise UnsupportedType, "Unsupported Type: #{type}"
      end
    end

    def self.configure_object(properties)
      proc do |base|
        attr_reader(*properties.keys.map(&:to_sym))

        define_method :initialize do |**kwargs|  
          properties.each do |name, options|
            instance_variable_set("@#{name}", kwargs.fetch(name.to_sym, options["value"]))
          end 
        end 
      end 
    end 
    private_class_method :configure_object

    def self.enum(options)
      proc do |base|
        const_set('VALUES', options.fetch(:values))
      end
    end
    private_class_method :enum
  end
end
