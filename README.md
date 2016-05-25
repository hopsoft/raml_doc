# RamlDoc

Generate API documentation from RAML files.

## Install

```sh
gem install raml_doc
```

## Usage

```sh
raml-doc --help
```

```sh
raml-doc -s /path/to/api.raml -t default -f html > /path/to/api.html
```

```ruby
RamlDoc.generate "/path/to/api.raml", "default", "html"
```
