require 'ui'
require 'board'
require 'turn'
require 'game'

describe Game do

  let(:ui)    {instance_double(UI).as_null_object}
  let(:board) {instance_double(Board).as_null_object}
  let(:turn)  {instance_double(Turn).as_null_object}
  let(:game)  {described_class.new(ui, board, turn)}

  before :each do
    allow(turn).to receive(:play_next_turn).and_return(board)
    allow(board).to receive(:full?).and_return(false)
  end

  it "plays several turns" do
    allow(board).to receive(:win?).and_return(false, false, true)
    game.play
    expect(turn).to have_received(:play_next_turn).exactly(3).times
  end

  it "plays first turn with X mark" do
    allow(board).to receive(:win?).and_return(true)
    game.play
    expect(turn).to have_received(:play_next_turn).once.with(board, :X)
  end

  it "swaps the mark in every turn" do
    allow(board).to receive(:win?).and_return(false, true)
    game.play
    expect(turn).to have_received(:play_next_turn).once.with(board, :X)
    expect(turn).to have_received(:play_next_turn).once.with(board, :O)
  end

  it "sends the winning mark when it wins" do
    allow(board).to receive(:win?).and_return(false, false, false, false, false, false, true)
    game.play
    expect(ui).to have_received(:print_win_message).with(:X).once
  end

  it "plays until there is a draw" do
    allow(board).to receive(:win?).and_return(false, false, false, false, false, false, false, false)
    allow(board).to receive(:full?).and_return(true)
    game.play
    expect(ui).to have_received(:print_draw_message).once
  end

  it "prints the board when game is over" do
    allow(board).to receive(:win?).and_return(true)
    game.play
    expect(ui).to have_received(:print_board).once.with(board)
  end

end