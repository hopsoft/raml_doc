require_relative "template_context"

module RamlDoc
  class View
    attr_reader :raml

    def initialize(raml)
      @raml = raml
    end

    def render(template, format)
      template_path = File.join(File.expand_path("../templates", __FILE__), format, template, "index.#{format}.erb")
      erb = ERB.new(File.read(template_path))
      template_context = TemplateContext.new(raml, template, format)
      erb.result template_context.context
    end

  end
end
