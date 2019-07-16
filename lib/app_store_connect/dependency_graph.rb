# frozen_string_literal: true

require 'tsort'

module AppStoreConnect
  class DependencyGraph
    include TSort

    class SpecificationNotFound < StandardError
      def initialize(type, name)
        super("Type specification not found: #{type} - #{name}")
      end
    end

    def initialize(specifications: [])
      @specifications_by_type = specifications.group_by(&:type)
    end

    def self.write!(filename:)
      # TODO: This doesn't produce the correct JSON
      json = JSON.pretty_generate(@types.values.flatten.to_json)

      File.open(filename) do |file|
        file.write json
      end
    end

    def specification_by(type:, name:)
      @specifications_by_type[type][name]
    end

    def specification_by!(type:, name:)
      specification_by(
        type: type,
        name: name
      ) || (raise SpecificationNotFound, type, name)
    end

    def specifications
      @specifications_by_type.values.flatten
    end

    def tsort_each_node(&block)
      specifications.each(&block)
    end

    def tsort_each_child(specification, &block)
      specification.specifications.each(&block)
    end

    def to_png(filename:)
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
          next if object_or_type.in?(['string', 'email', '*'])

          begin
            g.add_edge(nodes[node.name], nodes[object_or_type])
          rescue StandardError
            next
            # puts "Unable to add edge for #{node.name} -> #{object_or_type}"
          end
        end
      end

      g.output(png: filename)
    end
  end
end
