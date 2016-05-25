require "kramdown"
require "raml_doc/raml_helper"

module RamlDoc
  class View
    include RamlHelper

    def initialize(raml)
      @raml = raml
    end

    def render(template)
      template_path = File.join(File.expand_path("../templates", __FILE__), "#{template}.html.erb")
      template = ERB.new(File.read(template_path))
      template.result binding
    end

    def markdown(string)
      Kramdown::Document.new(string).to_html
    end
  end
end
