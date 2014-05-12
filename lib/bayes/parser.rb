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
      result.scan(/\{(.+?)\}/m) do |factor|
        factors << Bayes::Factor.new(factor.first)
      end

      factors
    end
  end
end
