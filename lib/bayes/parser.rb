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
      result = result.scan(/\{(.+?)\}/)
    end
  end
end
