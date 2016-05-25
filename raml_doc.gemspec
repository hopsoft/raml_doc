# coding: utf-8
# coding: utf-8
require_relative "lib/raml_doc/version"

Gem::Specification.new do |gem|
  gem.name        = "raml_doc"
  gem.license     = "MIT"
  gem.version     = RamlDoc::VERSION
  gem.authors     = ["Nathan Hopkins"]
  gem.email       = ["natehop@gmail.com"]
  gem.homepage    = "https://github.com/hopsoft/raml_doc"
  gem.summary     = "Generate API documentation from RAML files"

  gem.files       = Dir["lib/**/*.rb", "lib/**/*.erb", "bin/*", "[A-Z]*"]
  gem.test_files  = Dir["test/**/*.rb"]

  gem.executables << "raml-doc"

  gem.add_dependency "raml_ruby", "0.1.2"
  gem.add_dependency "kramdown", "1.11.1"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "pry-test"
  gem.add_development_dependency "coveralls"
end
