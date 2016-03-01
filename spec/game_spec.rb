require 'ui'
require 'board'
require 'turn'
require 'human_player'
require 'game'

describe Game do

  let(:ui)      {instance_double(UI).as_null_object}
  let(:board)   {instance_double(Board).as_null_object}
  let(:turn)    {instance_double(Turn).as_null_object}
  let(:player1) {instance_double(HumanPlayer).as_null_object}
  let(:player2) {instance_double(HumanPlayer).as_null_object}
  let(:game)    {described_class.new(ui, board, turn)}

  before :each do
    allow(turn).to receive(:play_next_turn).and_return(board)
    allow(board).to receive(:full?).and_return(false)
  end

  it "plays several turns" do
    allow(board).to receive(:win?).and_return(false, false, true)
    game.play(player1, player2)
    expect(turn).to have_received(:play_next_turn).exactly(3).times
  end

  it "plays first turn with the first player" do
    allow(board).to receive(:win?).and_return(true)
    game.play(player1, player2)
    expect(turn).to have_received(:play_next_turn).once.with(board, player1)
  end

  it "swaps the player in every turn" do
    allow(board).to receive(:win?).and_return(false, true)
    game.play(player1, player2)
    expect(turn).to have_received(:play_next_turn).once.with(board, player1)
    expect(turn).to have_received(:play_next_turn).once.with(board, player2)
  end

  it "prints a winning message with the correct mark" do
    allow(board).to receive(:win?).and_return(false, false, false, false, false, false, true)
    allow(player1).to receive(:mark).and_return(:X)
    game.play(player1, player2)
    expect(ui).to have_received(:print_win_message).with(:X).once
  end

  it "prints a draw message when there is a draw" do
    allow(board).to receive(:win?).and_return(false, false, false, false, false, false, false, false)
    allow(board).to receive(:full?).and_return(true)
    game.play(player1, player2)
    expect(ui).to have_received(:print_draw_message).once
  end

  it "prints the board when game is over" do
    allow(board).to receive(:win?).and_return(true)
    game.play(player1, player2)
    expect(ui).to have_received(:print_board).once.with(board)
  end

  it "clears the board when game is over" do
    allow(board).to receive(:win?).and_return(true)
    game.play(player1, player2)
    expect(board).to have_received(:clear).once
  end

end
