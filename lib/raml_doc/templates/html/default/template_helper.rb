module TemplateHelper
  def method_boostrap_label_css_class(method)
    case method.name
    when "get" then "label-success"
    when "post" then "label-primary"
    when "put" then "label-info"
    when "patch" then "label-warning"
    when "delete" then "label-danger"
    else "label-default"
    end
  end

  def method_element_id(method, *args)
    args << method.name
    args << method.parent.resource_path_name
    args.compact.join "-"
  end

  def method_querystring_example(parameters)
    qs = []
    parameters.each do |_, parameter|
      next if parameter.example.nil?
      next unless parameter.required || parameter.name.start_with?("utm_")
      qs << "#{parameter.name}=#{CGI.escape parameter.example}"
    end
    qs.join("&").strip
  end

  def method_uri_example(method)
    uri = []
    uri << "#{method.parent.parent.base_uri}#{method.parent.resource_path}"
    uri << "#{method_querystring_example method.query_parameters}"
    uri.keep_if { |entry| present? entry }
    uri.join "?"
  end
end
