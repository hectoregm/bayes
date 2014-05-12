require 'spec_helper'

describe Bayes::Factor do

  before :all do
    @values = "P(A=0)=0.1, P(A=1)=0.9"
  end

  describe "#new" do

    it 'creates a new factor' do
      expect(Bayes::Factor.new(@values)).to be_an_instance_of(Bayes::Factor)
    end
  end

  it 'has a signature' do
    expect(Bayes::Factor.new(@values).signature).to eq("P(A)")
  end

  it 'has random variables' do
    expect(Bayes::Factor.new(@values).variables).to eq(["A"])
  end

end
