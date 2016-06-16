require "raml_doc/raml_base"

module RamlDoc
  class RamlMethod < RamlBase
    attr_reader :name

    def initialize(name, hash)
      @name = name
      super hash
    end
  end
end
