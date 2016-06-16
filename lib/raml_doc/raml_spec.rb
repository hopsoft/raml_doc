require "active_support/all"
require "raml_doc/raml_base"
require "raml_doc/raml_resource"

module RamlDoc
  class RamlSpec < RamlBase
    attr_reader :hash

    def initialize(hash)
      hash.deep_transform_keys! { |key| key.to_s.underscore }
      super hash
    end

    def resource_keys
      hash.keys.select { |key| key.start_with? "/" }
    end

    def resources
      resource_keys.map { |key| RamlResource.new key, hash[key] }
    end
  end
end
