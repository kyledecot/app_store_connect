# frozen_string_literal: true

require 'tsort'

module AppStoreConnect
  class DependencyGraph
    include TSort

    class ObjectSpecificationNotFound < StandardError
      def initialize(name)
        super("Object specification not found: #{name}")
      end
    end

    def initialize(specifications:)
      @specifications_by_name = specifications
                                .map { |s| [s.name, s] }
                                .to_h
    end

    def object_specification_by(name:)
      @specifications_by_name[name]
    end

    def object_specification_by!(name:)
      object_specification = object_specification_by(name: name)

      return object_specification unless object_specification.nil?

      raise ObjectSpecificationNotFound, name
    end

    def tsort_each_node(&block)
      @specifications_by_name.values.each(&block)
    end

    def tsort_each_child(object_specification, &block)
      object_specification
        .properties
        .select { |_v, p| p.key?(:object) }
        .values.map do |property|
        object_specification_by!(name: property[:object])
      end.each(&block)
    end
  end
end
