require "bayes/version"
require "bayes/parser"
require "bayes/factor"
require "bayes/network"

module Bayes
  def self.create(path)
    Network.new(path)
  end
end
