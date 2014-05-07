require 'spec_helper'

describe Bayes::Parser do

  before :all do
    @path = "fixtures/network1.txt"
  end

  describe "#new" do
    it 'creates a new parser' do
      expect(Bayes::Parser.new(@path)).to be_an_instance_of(Bayes::Parser)
    end
  end

end
