require "raml"
require "erb"
require "raml_doc/version"
require "raml_doc/view"

module RamlDoc
  def self.generate(file_path, template)
    raml = Raml.parse_file(file_path)
    view = View.new(raml)
    view.render template
  end
end
