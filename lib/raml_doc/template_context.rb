require "cgi"
require "kramdown"
require "pry"

module RamlDoc
  class TemplateContext
    attr_reader :raml, :template, :format

    def initialize(raml, template, format)
      @raml = raml
      @template = template
      @format = format
      include_helper
    end

    def present?(value)
      return !value.empty? if value.respond_to?(:empty?)
      !!value
    end

    def markdown(string)
      Kramdown::Document.new(string).to_html
    end

    def context
      binding
    end

    def render_partial(name, locals: {}, collection: nil)
      if collection
        collection.each_with_object([]) do |item, memo|
          instance_variable_set "@#{name}", item
          erb = ERB.new(File.read(partial_path(name)))
          memo << erb.result(binding)
          remove_instance_variable "@#{name}"
        end.join
      else
        erb = ERB.new(File.read(partial_path(name)))
        erb.result binding
      end
    end

    private

    def partial_path(name)
      File.expand_path("../templates/#{format}/#{template}/_#{name}.#{format}.erb", __FILE__)
    end

    def helper_path
      @helper_path ||= File.expand_path("../templates/#{format}/#{template}/template_helper.rb", __FILE__)
    end

    def include_helper
      if File.exist?(helper_path)
        load helper_path
        eigen.send :include, TemplateHelper
      end
    end

    def eigen
      class << self
        self
      end
    end
  end
end
