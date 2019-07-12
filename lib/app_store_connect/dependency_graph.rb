# frozen_string_literal: true

require 'tsort'

module AppStoreConnect
  class DependencyGraph
    include TSort

    class TypeSpecificationNotFound < StandardError
      def initialize(name)
        super("Type specification not found: #{name}")
      end
    end

    class ObjectSpecificationNotFound < StandardError
      def initialize(name)
        super("Object specification not found: #{name}")
      end
    end

    def initialize(object_specifications:, type_specifications: {})
      @object_specifications_by_name = object_specifications
                                       .map { |s| [s.name, s] }
                                       .to_h

      @type_specifications_by_name = type_specifications
                                     .map { |s| [s.name, s] }
                                     .to_h
    end

    def type_specification_by(name:)
      @type_specifications_by_name[name]
    end

    def object_specification_by(name:)
      @object_specifications_by_name[name]
    end

    def type_specification_by!(name:)
      type_specification = type_specification_by(name: name)

      return type_specification unless type_specification.nil?

      raise TypeSpecificationNotFound, name
    end

    def object_specification_by!(name:)
      object_specification = object_specification_by(name: name)

      return object_specification unless object_specification.nil?

      raise ObjectSpecificationNotFound, name
    end

    def tsort_each_node(&block)
      specifications = @object_specifications_by_name.values + @type_specifications_by_name.values

      specifications.each(&block)
    end

    def tsort_each_child(specification, &block)
      specification
        .properties
        .select { |_v, p| p.key?(:object) || p.key?(:type) }
        .values.map do |property|
          object_specification_by(name: property[:object]) || type_specification_by(name: property[:object])
        end.each(&block)
    end

    def debug!
      require 'ruby-graphviz'
      g = GraphViz.new(:G, type: :digraph)

      nodes = {}

      tsort.each do |node|
        fillcolor = node.is_a?(TypeSpecification) ? '#bdfade' : '#faf9a3'
        nodes[node.name] ||= g.add_node(node.name, shape: :rect, fillcolor: fillcolor, style: 'filled')
      end

      tsort.each do |node|
        node.properties.each do |_, p|
          object_or_type = p['object'] || p['type']

          next unless object_or_type

          g.add_edge(nodes[node.name], nodes[object_or_type])
        end
      end

      g.output(png: '/Users/kyledecot/Desktop/hello_world.png')
    end
  end
end
