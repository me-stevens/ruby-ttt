require 'board'
require 'console'
require 'validator'
require 'ui'

describe UI do

  let(:board)  {Board.new([[:E, :E, :E], [:E, :E, :E], [:E, :E, :E]])}
  let(:input)  {StringIO.new}
  let(:output) {StringIO.new}
  let(:ui)     {described_class.new(Console.new(input, output), Validator.new)}

  it "clears the screen" do
    ui.clear
    expect(output.string).to eq(UI::CLEAR)
  end

  it "clears the screen before printing the board" do
    ui.print_board(board)
    expect(output.string).to include(UI::CLEAR)
  end

  it "prints a board with format" do
    board = Board.new([
      [:X, :O, :X],
      [:O, :X, :O],
      [:O, :O, :X]
    ])
    ui.print_board(board)
    expect(output.string).to include("X\tO\tX\nO\tX\tO\nO\tO\tX\n")
  end

  it "prints corresponding index if a cell is empty" do
    ui.print_board(board)
    expect(output.string).to include("1\t2\t3\n4\t5\t6\n7\t8\t9\n")
  end

  it "prints whose turn is it when asking for a cell" do
    input.string = "1\n"
    ui.read_cell(board, :X)
    expect(output.string).to include(UI::TURN)
    expect(output.string).to include(:X.to_s)
  end

  it "prints the prompt for a cell index" do
    input.string = "1\n"
    ui.read_cell(board, :X)
    expect(output.string).to include(UI::CELL)
  end

  it "reads a cell index from prompt" do
    input.string = "1\n"
    expect(ui.read_cell(board, :X)).to eq(0)
  end

  it "prints an error message if wrong cell index" do
    input.string = "asdf\n1\n"
    ui.read_cell(board, :X)
    expect(output.string).to include(UI::ERROR_WRONG_INPUT)
  end

  it "keeps asking until valid cell index" do
    input.string = "asdf\n-1\n0\n1000\n1\n"
    expect(ui.read_cell(board, :X)).to eq(0)
    expect(output.string.scan(UI::ERROR_WRONG_INPUT).size).to eq(4)
  end

  it "prints a win message" do
    ui.print_win_message(:X)
    expect(output.string).to include(UI::WIN)
    expect(output.string).to include(:X.to_s)
  end

  it "prints a draw message" do
    ui.print_draw_message
    expect(output.string).to include(UI::DRAW)
  end

end
