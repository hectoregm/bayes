module Bayes
  class Factor
    attr_accessor :variables, :signature, :table
    def initialize(signature, variables, data)
      @signature = signature
      @variables = variables
      @table = {}

      data.scan(/P\((.+?)\)=([0-9\.]+)/) do |state, value|
        state = state.scan(/[A-Z]+?=([0-9]+)/).flatten
        @table[state] = value
      end
    end

    def [](index)
      @table[index]
    end

    def multiply(other)
      variables = self.variables + other.variables
      variables.uniq!
      result = Factor.new(self.signature, variables, "")
    end
  end
end
