require "queryable_hash"

module RamlDoc
  class RamlBase
    attr_reader :hash

    def initialize(hash)
      hash = HashWithIndifferentAccess.new(hash)
      @hash = QueryableHash.wrap(hash)
    end

    def method_missing(name, *args)
      value = hash.get(name.to_s)
      value ||= super rescue nil
    end

    def respond_to?(name)
      true
    end
  end
end
