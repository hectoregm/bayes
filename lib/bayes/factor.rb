module Bayes
  class Factor
    attr_reader :variables, :signature, :hash
    def initialize(data)
      @signature = /P\((.*?)\)/.match(data)[0].gsub(/=[0-9]+/,'')
      @variables = signature.scan(/([A-Z]+?)[|,]*/).flatten
      @variables.shift
      @table = {}

      data.scan(/P\((.+?)\)=([0-9\.]+)/) do |state, value|
        state = state.scan(/[A-Z]+?=([0-9]+)/).flatten
        @table[state] = value
      end
    end

    def [](index)
      @table[index]
    end
  end
end
