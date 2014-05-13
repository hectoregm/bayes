module Bayes
  class Factor
    attr_accessor :variables, :signature, :table
    def initialize(signature, variables, data)
      @signature = signature
      @variables = variables
      @table = {}

      data.scan(/P\((.+?)\)=([0-9\.]+)/) do |state, value|
        #puts "State: #{state}"
        #puts "Value: #{value}"
        array = state.scan(/([A-Z]+?)=([0-9]+)/).sort.flatten
        state = Hash[*array]
        @table[state] = value
      end
    end

    def [](index)
      @table[index]
    end

    def marginalization(variable)
      var = @variables.last
      puts @variables.detect { |var| var.name == variable }.inspect
      puts @variables.select { |var| var.name != variable }.inspect
    end

    def multiply(other)
      variables = self.variables + other.variables
      variables.uniq!
      result = Factor.new(self.signature, variables, "")
    end
  end
end
