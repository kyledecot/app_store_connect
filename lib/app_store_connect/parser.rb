# frozen_string_literal: true

module AppStoreConnect
  class Parser
    def self.parse!(config)
      parse_objects(config['Object'])
    end

    def self.parse_objects(objects)
      object_specifications = objects.map do |name, options|
        ObjectSpecification.new(
          name: name,
          properties: options['Properties']
        )
      end

      dependency_graph = AppStoreConnect::DependencyGraph.new(
        specifications: object_specifications
      )

      build(dependency_graph.tsort)
    end
    private_class_method :parse_objects

    def self.build((current, *rest))
      klass = Factory.build(:object, current)

      (*upper, name) = current.name.split('.')

      (['AppStoreConnect'] + upper).join('::').constantize.const_set(name, klass)

      build(rest) unless rest.empty?
    end

    def self.parse_types(types)
      types.each do |name, options|
        type = options.delete('type')

        klass = Factory.build(type, options.deep_symbolize_keys)

        AppStoreConnect::Type.const_set(name, klass)
      end
    end
    private_class_method :parse_types
  end
end
