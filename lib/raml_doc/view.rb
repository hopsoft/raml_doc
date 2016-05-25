require "kramdown"
require "raml_doc/raml_helper"

module RamlDoc
  class View
    include RamlHelper

    def initialize(raml)
      @raml = raml
    end

    def render(template, format)
      template_path = File.join(File.expand_path("../templates", __FILE__), format, template, "index.#{format}.erb")
      template = ERB.new(File.read(template_path))
      template.result binding
    end

    def present?(value)
      return !value.empty? if value.respond_to?(:empty?)
      !!value
    end

    def markdown(string)
      Kramdown::Document.new(string).to_html
    end

    def method_element_id(method, *args)
      args << method.name
      args << method.parent.resource_path_name
      args.compact.join "-"
    end
  end
end
