require 'bayes'

describe Bayes do
  it 'create' do
    expect(Bayes.create).to be_an_instance_of(Bayes::Network)
  end
end

