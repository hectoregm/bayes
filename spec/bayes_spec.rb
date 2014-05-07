require 'spec_helper'

describe Bayes do

  describe "#create" do
    it 'creates a new bayesian network' do
      expect(Bayes.create).to be_an_instance_of(Bayes::Network)
    end
  end

end
