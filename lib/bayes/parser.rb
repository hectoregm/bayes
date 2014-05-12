module Bayes
  class Parser
    def initialize(path)
      @content = File.read(path)
    end

    def get_random_variables
      return @variables if @variables

      result = /Variables:\s*\[(.+?)\]/m.match(@content)[1]
      @variables = []
      result.scan(/{(.+?):([0-9,]+?)}/) do |name,values|
        @variables << Bayes::Variable.new(name,values.split(','))
      end

      @variables
    end

    def get_factors
      result = /Probabilidades:\s*\[(.+?)\]/m.match(@content)[1]
      factors = []
      result.scan(/\{(.+?)\}/m) do |result|
        factor = result.first
        signature = /P\((.*?)\)/.match(factor)[0].gsub(/=[0-9]+/,'')
        variables = signature.scan(/([A-Z]+?)[|,]*/).flatten
        variables.shift

        factors << Bayes::Factor.new(signature, select_variables(variables), factor)
      end

      factors
    end

    def select_variables(names)
      get_random_variables.select do |var|
        names.include? var.name
      end
    end
  end
end
