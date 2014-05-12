require 'spec_helper'

describe Bayes::Factor do

  before :all do
    @factor = Bayes::Factor.new("P(A)", ["A"], "P(A=0)=0.1, P(A=1)=0.9")
  end

  describe "#new" do

    it 'creates a new factor' do
      expect(@factor).to be_an_instance_of(Bayes::Factor)
    end
  end

  it 'has a signature' do
    expect(@factor.signature).to eq("P(A)")
  end

  it 'has random variables' do
    expect(@factor.variables).to eq(["A"])
  end

end
