require 'player'
require 'ui'

describe Player do

  let(:player) {described_class.new(nil, :X)}

  it "retrieves the player's mark" do
    expect(player.mark).to eq(:X)
  end

end
