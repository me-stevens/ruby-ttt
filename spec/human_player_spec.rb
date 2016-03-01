require 'board'
require 'human_player'
require 'ui'

describe HumanPlayer do

  let(:ui)    {instance_double(UI).as_null_object}
  let(:human) {described_class.new(ui, :X)}

  it "subclasses the player class so gets the mark" do
    expect(human.mark).to eq(:X)
  end

  it "prints the turn" do
    board = instance_double(Board).as_null_object
    human.make_move(board)
    expect(ui).to have_received(:print_turn).with(:X)
  end

  it "makes a move" do
    board = instance_double(Board).as_null_object
    allow(ui).to receive(:read_cell).and_return(0)
    expect(human.make_move(board)).to eq(0)
  end

end
