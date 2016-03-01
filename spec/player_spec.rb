require 'ui'
require 'player'

describe Player do

  let(:ui)     {instance_double(UI).as_null_object}
  let(:player) {described_class.new(ui, :X)}

  it "retrieves the player's mark" do
    expect(player.mark).to eq(:X)
  end

end
