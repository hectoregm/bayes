require 'spec_helper'

describe Bayes::Network do

  before :all do
    @netone_path = File.expand_path("../../fixtures/network1.txt", __FILE__)
    @netone_variables = ["A","B","C"]
  end

  describe "#new" do
    it 'creates a new bayes network' do
      expect(Bayes::Network.new(@netone_path)).to be_an_instance_of(Bayes::Network)
    end

    it 'uses parser to get the data for the network' do
      expect(Bayes::Parser).to receive(:new).
        with(@netone_path).
        and_return(Bayes::Parser.new(@netone_path))

      Bayes::Network.new(@netone_path)
    end
  end

  describe "#variables" do
    it 'return an array of the random variables in the network' do
      @network = Bayes::Network.new(@netone_path)
      expect(@network.variables).to eql(@netone_variables)
    end
  end

end
