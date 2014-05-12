module Bayes
  class Parser
    def initialize(path)
      @content = File.read(path)
    end

    def get_random_variables
      result = /Variables:\s*\[(.+?)\]/m.match(@content)[1]
      result.scan(/{(.+?):/).flatten
    end

    def get_factors
      result = /Probabilidades:\s*\[(.+?)\]/m.match(@content)[1]
      factors = []
      result.scan(/\{(.+?)\}/m) do |result|
        factor = result.first
        signature = /P\((.*?)\)/.match(factor)[0].gsub(/=[0-9]+/,'')
        variables = signature.scan(/([A-Z]+?)[|,]*/).flatten
        variables.shift

        factors << Bayes::Factor.new(signature, variables, factor)
      end

      factors
    end
  end
end
