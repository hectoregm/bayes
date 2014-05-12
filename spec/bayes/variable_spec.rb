require 'spec_helper'

describe Bayes::Variable do

  before :all do
    @random_name = "A"
    @random_values = ["0", "1", "2"]
    @variable = Bayes::Variable.new(@random_name,
                                    @random_values)
  end

  describe "#new" do
    it 'creates a new random variable' do
      expect(@variable).to be_an_instance_of(Bayes::Variable)
    end
  end

  it 'has a name' do
    expect(@variable.name).to eq("A")
  end


  describe "has range of valid values" do
    context 'without variable name prefix' do
      it 'has a range of valid values' do
        expect(@variable.values).to eq(["0","1","2"])
      end
    end

    context 'with variable name prefix' do
      it 'has a range of valid values' do
        expect(@variable.values(true)).to eq(["A0","A1","A2"])
      end
    end
  end

end
