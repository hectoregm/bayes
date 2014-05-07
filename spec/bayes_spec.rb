require 'spec_helper'

describe Bayes do

  before :all do
    @netone_path = File.expand_path("../fixtures/network1.txt", __FILE__)
  end

  describe "#create" do
    it 'creates a new bayesian network' do
      expect(Bayes.create(@netone_path)).to be_an_instance_of(Bayes::Network)
    end
  end

end
