require 'spec_helper'

describe Bayes::Network do

  describe "#new" do
    it 'creates a new bayes network' do
      expect(Bayes::Network.new).to be_an_instance_of(Bayes::Network)
    end
  end

end
