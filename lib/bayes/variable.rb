module Bayes
  class Variable
    include Comparable
    attr_accessor :name

    def initialize(name, values)
      @name = name
      @values = values
    end

    def self.generate_space(variables, initial_value = 0)
      variables = variables.dup
      initial_variable = variables.first
      initial_space = initial_variable.values(true)
      space = variables.inject(initial_space) { |space, variable| variable.space(space) }

      result = {}
      space.each do |row|
        result[Hash[*row]] = initial_value
      end

      result
    end

    def space(array)
      result = []
      array.each do |elem|
        values(true).each do |val|
          result << (elem + val)
        end
      end

      result
    end

    def values(with_prefix=false)
      if with_prefix
        @values.collect do |val|
          [name,val]
        end
      else
        @values
      end
    end

    def ==(other)
      self.name == other.name && self.values == other.values
    end

    def <=>(other)
      self.name <=> other.name
    end
  end
end
