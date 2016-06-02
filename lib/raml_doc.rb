require "raml"
require "erb"
require "active_support/all"
require "raml_doc/version"
require "raml_doc/view"

module RamlDoc
  def self.generate(file_path, template="default", format="html")
    raml = Raml.parse_file(file_path)
    view = View.new(raml)
    view.render template, format
  end
end
