require 'board'
require 'player'
require 'ui'

describe Player do

  let(:ui)     {instance_double(UI).as_null_object}
  let(:player) {described_class.new(ui, :X)}

  it "retrieves the player's mark" do
    expect(player.mark).to eq(:X)
  end

  it "prints the turn" do
    board = Board.new([[:E, :E, :E], [:E, :E, :E], [:E, :E, :E]])
    player.make_move(board)
    expect(ui).to have_received(:print_turn).with(:X)
  end

end
