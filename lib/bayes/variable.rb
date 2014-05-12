module Bayes
  class Variable
    attr_accessor :name, :range

    def initialize(name, range)
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
  end
end
