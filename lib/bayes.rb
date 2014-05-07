require "bayes/version"
require "bayes/network"

module Bayes
  def self.create(path)
    Network.new
  end
end
