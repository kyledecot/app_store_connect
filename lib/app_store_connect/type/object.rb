# frozen_string_literal: true

require 'app_store_connect/object/properties'

module AppStoreConnect
  class Object
    include Properties

    def initialize(**kwargs)
      property_specifications
        .each { |ps| properties[ps.name] = ps.rich(**kwargs) }
    end

    def to_h
      property_specifications
        .map { |ps| [ps.name, ps.plain(properties[ps.name])] }
        .to_h
    end
  end
end
