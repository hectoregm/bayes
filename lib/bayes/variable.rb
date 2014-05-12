module Bayes
  class Variable
    attr_accessor :name

    def initialize(name, values)
      @name = name
      @values = values
    end

    def space(array)
      result = []
      values.each do |value|
        array.each do |elem|
          result << (elem + [value])
        end
      end

      result
    end

    def values(with_prefix=false)
      if with_prefix
        @values.collect do |val|
          name + val
        end
      else
        @values
      end
    end
  end
end
