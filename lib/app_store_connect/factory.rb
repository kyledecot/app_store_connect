module AppStoreConnect
  class Factory
    UnsupportedType = Class.new(StandardError)

    TYPES = {
      'enum' => 'Enum'
    }

    def self.type(type:, **options)
      case type
      when *TYPES.keys 
        klass = "AppStoreConnect::Type::#{TYPES[type]}".constantize
        Class.new(klass, &send(type, options))
      else
        raise UnsupportedType, "Unsupported Type: #{type}"
      end 
    end

    def self.enum(options)
      Proc.new do |base|
        base.const_set("VALUES", options.fetch(:values))
      end 
    end
    private_class_method :enum
  end 
end 
