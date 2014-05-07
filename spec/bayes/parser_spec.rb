require 'spec_helper'

describe Bayes::Parser do

  before :all do
    @netone_path = File.expand_path("../../fixtures/network1.txt", __FILE__)
    @netone_variables = ["A","B","C"]
  end

  describe "#new" do
    it 'creates a new parser' do
      expect(Bayes::Parser.new(@netone_path)).to be_an_instance_of(Bayes::Parser)
    end
  end

  describe "#get_random_variables" do
    it 'return an array of the random variables' do
      @parser = Bayes::Parser.new(@netone_path)
      expect(@parser.get_random_variables).to eql(@netone_variables)
    end
  end

end
