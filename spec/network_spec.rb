require 'bayes'

describe Bayes::Network do
  it 'create a new bayes network' do
    expect(Bayes::Network.new).to be_an_instance_of(Bayes::Network)
  end
end
