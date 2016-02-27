require 'ui'
require 'board'
require 'turn'

describe Turn do

  let(:ui)    {instance_double(UI).as_null_object}
  let(:board) {instance_double(Board).as_null_object}
  let(:turn)  {described_class.new(ui)}
  let(:mark)  {:X}

  before :each do
    allow(ui).to receive(:read_cell).and_return(0)
  end

  it "prints the board" do
    turn.play_next_turn(board, mark)
    expect(ui).to have_received(:print_board).with(board)
  end

  it "asks the user for a cell to place the mark" do
    turn.play_next_turn(board, mark)
    expect(ui).to have_received(:read_cell).with(board, mark)
  end

  it "places the mark in the board" do
    turn.play_next_turn(board, mark)
    expect(board).to have_received(:place_mark).with(0, mark)
  end

  it "returns the updated board" do
    board = Board.new([[:E, :E, :E], [:E, :E, :E], [:E, :E, :E]])
    rows  = [[:X, :E, :E], [:E, :E, :E], [:E, :E, :E]]
    turn  = described_class.new(ui)
    expect(turn.play_next_turn(board, mark).all).to eq(Matrix.rows(rows))
  end

end
