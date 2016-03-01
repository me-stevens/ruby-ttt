require 'board'
require 'console'
require 'ui'

describe UI do

  let(:board)  {Board.new([[:E, :E, :E], [:E, :E, :E], [:E, :E, :E]])}
  let(:input)  {StringIO.new}
  let(:output) {StringIO.new}
  let(:ui)     {described_class.new(Console.new(input, output))}

  it "clears the screen" do
    ui.clear
    expect_to_print(UI::CLEAR)
  end

  it "clears the screen before printing the board" do
    ui.print_board(board)
    expect_to_include(UI::CLEAR)
  end

  it "prints a board with format" do
    board = Board.new([
      [:X, :O, :X],
      [:O, :X, :O],
      [:O, :O, :X]
    ])
    ui.print_board(board)
    expect_to_include("X\tO\tX\nO\tX\tO\nO\tO\tX\n")
  end

  it "prints corresponding index if a cell is empty" do
    ui.print_board(board)
    expect_to_include("1\t2\t3\n4\t5\t6\n7\t8\t9\n")
  end

  it "prints whose turn is it" do
    ui.print_turn(:X)
    expect_to_include(UI::TURN)
    expect_to_include(:X.to_s)
  end

  it "prints the prompt for a cell index" do
    input.string = "1\n"
    ui.read_cell(board)
    expect_to_include(UI::CELL)
  end

  it "reads a cell index from prompt" do
    input.string = "1\n"
    expect(ui.read_cell(board)).to eq(0)
  end

  it "prints an error message if wrong cell index" do
    input.string = "asdf\n1\n"
    ui.read_cell(board)
    expect_to_include(UI::ERROR_WRONG_INPUT)
  end

  it "keeps asking until valid cell index" do
    input.string = "asdf\n-1\n0\n1000\n1\n"
    expect(ui.read_cell(board)).to eq(0)
    expect(output.string.scan(UI::ERROR_WRONG_INPUT).size).to eq(4)
  end

  it "prints a win message" do
    ui.print_win_message(:X)
    expect_to_include(UI::WIN)
    expect_to_include(:X.to_s)
  end

  it "prints a draw message" do
    ui.print_draw_message
    expect_to_include(UI::DRAW)
  end

  it "prints the prompt message for replaying" do
    input.string = "\n"
    ui.replay?
    expect_to_print(UI::REPLAY)
  end

  it "reads a positive answer to replay" do
    input.string = UI::YES
    expect(ui.replay?).to eq(true)
  end

  it "reads a positive answer to replay, case insensitive" do
    input.string = UI::YES.upcase
    expect(ui.replay?).to eq(true)
  end

  it "reads a negative answer to replay" do
    input.string = "\n"
    expect(ui.replay?).to eq(false)
  end

  it "prints a good bye message" do
    ui.bye
    expect_to_include(UI::BYE)
  end

  def expect_to_print(message)
    expect(output.string).to eq(message)
  end

  def expect_to_include(message)
    expect(output.string).to include(message)
  end

end
