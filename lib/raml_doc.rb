require "yaml"
require "raml_doc/version"
require "raml_doc/raml_spec"
require "raml_doc/view"

module RamlDoc
  def self.generate(file_path, template="default", format="html")
    raw = File.read(File.expand_path(file_path))
    raml = RamlSpec.new(YAML.load raw)
    view = View.new(raml)
    view.render template, format
  end
end
