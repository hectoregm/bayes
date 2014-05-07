require 'spec_helper'

describe Bayes::Network do

  before :all do
    @path = "fixtures/network1.txt"
  end

  describe "#new" do
    it 'creates a new bayes network' do
      expect(Bayes::Network.new(@path)).to be_an_instance_of(Bayes::Network)
    end

    it 'uses parser to get the data for the network' do
      expect(Bayes::Parser).to receive(:new).with(@path)
      Bayes::Network.new(@path)
    end
  end

end
