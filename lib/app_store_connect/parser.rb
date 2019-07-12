# frozen_string_literal: true

module AppStoreConnect
  class Parser
    def self.parse!(config)
      objects = config['Object']
      types = config['Type']

      type_specifications = types.map do |name, options|
        TypeSpecification.new(
          name: name,
          options: options
        )
      end

      object_specifications = objects.map do |name, options|
        ObjectSpecification.new(
          name: name,
          options: options
        )
      end

      dependency_graph = AppStoreConnect::DependencyGraph.new(
        object_specifications: object_specifications,
        type_specifications: type_specifications
      )

      dependency_graph.debug!

      build(dependency_graph.tsort)
    end

    def self.build((current, *rest))
      klass = Factory.build(:object, current)
      puts current.name

      (*upper, name) = current.name.split('.')

      (['AppStoreConnect'] + upper).join('::').constantize.const_set(name, klass)

      build(rest) unless rest.empty?
    end
  end
end
