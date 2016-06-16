module TemplateHelper
  def method_boostrap_btn_css_class(method)
    case method.name
    when "get" then "btn-success"
    when "post" then "btn-primary"
    when "put" then "btn-info"
    when "patch" then "btn-warning"
    when "delete" then "btn-danger"
    else "btn-default"
    end
  end

  def method_element_id(*args)
    args << method.name
    args << resource.name
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
    uri.keep_if { |entry| entry.present? }
    uri.join "?"
  end
end
