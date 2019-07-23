# frozen_string_literal: true

require 'tsort'

require 'app_store_connect/specification/web_service_endpoint'
require 'app_store_connect/specification/object'
require 'app_store_connect/specification/type'

module AppStoreConnect
  class Specification
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

    def to_json(*_args)
      JSON.pretty_generate(
        'Object' => Hash[specifications.map do |spec|
          next unless spec.class::TYPE == :object

          [spec.name, spec.options]
        end],
        'Type' => Hash[specifications.map do |spec|
                         next unless spec.class::TYPE == :type

                         [spec.name, spec.options]
                       end]
      )
    end

    def specification_by(type:, name:)
      if polymorphic?(name)
        return Class.new do
          def related_type_names_by_type
            {}
          end
        end.new
      elsif basic?(name)
        return Class.new do
          def related_type_names_by_type
            {}
          end
        end.new
      end

      @registries_by_type[type][name]
    end

    def basic?(type)
      type.in?(%w[string])
    end

    def polymorphic?(name)
      name == '*'
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
    # def initialize(documentation:)
    # @specifications = documentation.specifications
    #
    # @dependency_graph = DependencyGraph.new(
    # specifications: documentation.specifications
    # )
    # end
    #
    # def to_json
    # @dependency_graph.to_json
    # end
  end
end
