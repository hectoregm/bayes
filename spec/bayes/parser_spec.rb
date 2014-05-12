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
    it 'returns an array of the random variables' do
      @parser = Bayes::Parser.new(@netone_path)
      expect(@parser.get_random_variables).to eql(@netone_variables)
    end
  end

  describe "#get_factors" do
    it 'returns an array of factors' do
      @parser = Bayes::Parser.new(@netone_path)
      expect(@parser.get_factors).to be_a(Array)
      actual = @parser.get_factors.all? do |factor|
        factor.is_a? Bayes::Factor
      end

      expect(actual).to be true
    end
  end

end
