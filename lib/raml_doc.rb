require "raml"
require "erb"
require "raml_doc/version"
require "pry"

module RamlDoc
  def self.generate(file_path, template)
    raml = Raml.parse_file(file_path)
    template_path = File.join(File.expand_path("../raml_doc/templates", __FILE__), template, "api.html.erb")
    template = ERB.new(File.read(template_path))
    result = ""

    Object.new.instance_eval do
      @raml = raml
      result = template.result(binding)
    end

    result
  end
end
