module Bayes
  class Network
    attr_reader :variables

    def initialize(path)
      parser = Parser.new(path)
      @variables = parser.get_random_variables
    end
  end
end
