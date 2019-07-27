# frozen_string_literal: true

module AppStoreConnect
  class Parser
    def self.parse!(config)
      objects = config['Object']
      types = config['Type']

      type_specifications = types.map do |name, options|
        Specification::Type.new(
          name: name,
          options: options
        )
      end

      object_specifications = objects.map do |name, options|
        Specification::Object.new(
          name: name,
          options: options
        )
      end

      specifications = object_specifications + type_specifications

      dependency_graph = AppStoreConnect::DependencyGraph.new(
        specifications: specifications
      )

      build(dependency_graph.tsort.reverse)
    end

    def self.build((current, *rest))
      klass = Factory.build(:object, current)

      (*upper, name) = current.name.split('.')

      (['AppStoreConnect'] + upper).join('::').constantize.const_set(name, klass)

      build(rest) unless rest.empty?
    end
  end
end
