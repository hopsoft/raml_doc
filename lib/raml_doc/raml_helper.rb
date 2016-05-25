module RamlHelper
  def max_parameter(method)
    method.query_parameters.max_by do |name_and_parameter|
      name_and_parameter.first.size
    end.last
  end
end
