module Bayes
  class Factor
    attr_accessor :variables, :signature, :table
    def initialize(signature, variables, data)
      @signature = signature
      @variables = variables
      @table = {}

      data.scan(/P\((.+?)\)=([0-9\.]+)/) do |state, value|
        array = state.scan(/([A-Z]+?)=([0-9]+)/).sort.flatten
        state = Hash[*array]
        @table[state] = value.to_f
      end
    end

    def variables_names
      return @variables_names if @variables_names

      @variables_names = @variables.collect { |var| var.name }
    end

    def [](key)
      key = key.dup
      key.delete_if { |k,v| !variables_names.include?(k)}
      @table[key]
    end

    def []=(key,value)
      key = key.dup
      key.delete_if { |k,v| !variables_names.include?(k)}
      @table[key] = value
    end

    def marginalization(variable)
      temp = @variables.detect { |var| var.name == variable }
      new_variables = @variables.select { |var| var.name != variable }

      new_factor = Factor.new("New Factor", new_variables, "")
      new_space = Bayes::Variable.generate_space(new_variables)
      new_factor.table = new_space

      @table.keys.each do |key|
        new_factor[key] += @table[key]
      end

      new_factor
    end

    def multiply(other)
      new_variables = self.variables + other.variables
      new_variables.sort!.uniq!
      new_factor = Factor.new(self.signature, new_variables, "")
      new_space = Bayes::Variable.generate_space(new_variables, 1)
      new_factor.table = new_space

      new_factor.table.keys.each do |key|
        new_factor.table[key] = self[key] * other[key]
      end

      new_factor
    end

    def ==(other)
      self.variables == other.variables && self.table == other.table
    end
  end
end
