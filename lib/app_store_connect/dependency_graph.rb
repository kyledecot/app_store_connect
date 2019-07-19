# frozen_string_literal: true

require 'tsort'

module AppStoreConnect
  class DependencyGraph
    include TSort

    class Registry
      def initialize
        @store = {}
      end

      def []=(key, value)
        @store[key] = value
      end

      def [](key)
        @store[key]
      end

      def to_a
        @store.values
      end
    end

    class SpecificationNotFound < StandardError
      def initialize(type, name)
        super("Type specification not found: #{type} - #{name}")
      end

      def ==(other)
        super(other) && other.type == type && other.name == name
      end
    end

    def initialize(specifications: [])
      @registries_by_type = {}.tap do |hash|
        hash.default_proc = ->(h, k) { h[k] = Registry.new }

        specifications.each { |s| hash[s.class::TYPE][s.name] = s }
      end
    end

    def self.write!(filename:)
      # TODO: This doesn't produce the correct JSON
      json = JSON.pretty_generate(@types.values.flatten.to_json)

      File.open(filename) do |file|
        file.write json
      end
    end

    def specification_by(type:, name:)
      @registries_by_type[type][name]
    end

    def specification_by!(type:, name:)
      specification = specification_by(
        type: type,
        name: name
      )

      return specification if specification.present?

      raise SpecificationNotFound.new(type, name)
    end

    def specifications
      @specifications ||= @registries_by_type.values.flat_map(&:to_a)
    end

    def tsort_each_node(&block)
      specifications.each(&block)
    end

    def tsort_each_child(specification, &block)
      specification.related_type_names_by_type.flat_map do |type, names|
        names.map { |n| specification_by!(type: type, name: n) }
      end.each(&block)
    rescue StandardError => e
      binding.pry
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
