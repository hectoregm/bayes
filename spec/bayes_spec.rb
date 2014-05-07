require 'spec_helper'

describe Bayes do

  before :all do
    @path = "fixtures/network1.txt"
  end

  describe "#create" do
    it 'creates a new bayesian network' do
      expect(Bayes.create(@path)).to be_an_instance_of(Bayes::Network)
    end
  end

end
