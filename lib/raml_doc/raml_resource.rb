require "raml_doc/raml_base"
require "raml_doc/raml_method"

module RamlDoc
  class RamlResource < RamlBase
    attr_reader :path, :name

    def initialize(path, hash)
      @path = path
      @name = path.split("/").last
      super hash
    end

    def method_keys
      %w(get head post put delete trace options connect patch)
    end

    def methods
      method_keys.each_with_object([]) do |key, memo|
        memo << RamlMethod.new(key, hash[key]) if hash[key].present?
      end
    end
  end
end
