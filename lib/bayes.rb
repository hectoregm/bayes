require "bayes/version"
require "bayes/network"

module Bayes
  def self.create
    Network.new
  end
end
