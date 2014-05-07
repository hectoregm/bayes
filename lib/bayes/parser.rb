module Bayes
  class Parser
    def initialize(path)
      @content = File.read(path)
    end

    def get_random_variables
      result = /Variables:\s*\[(.+?)\]/m.match(@content)[1]
      result.scan(/(.?+):/).flatten
    end
  end
end
