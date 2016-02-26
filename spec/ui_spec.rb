require 'console'
require 'validator'
require 'ui'
require 'board'

describe UI do

  let(:board)  {Board.new([
    [:X, :O, :X],
    [:O, :X, :O],
    [:O, :O, :X]
  ])}
  let(:input)  {StringIO.new}
  let(:output) {StringIO.new}
  let(:ui)     {described_class.new(Console.new(input, output), Validator.new)}

  it "prints a board with format" do
    ui.print_board(board)
    expect(output.string).to eq("X\tO\tX\nO\tX\tO\nO\tO\tX\n")
  end

  it "prints corresponding index if a cell is empty" do
    board = Board.new([[:E, :E, :E], [:E, :E, :E], [:E, :E, :E]])
    ui.print_board(board)
    expect(output.string).to eq("1\t2\t3\n4\t5\t6\n7\t8\t9\n")
  end

  it "prints the prompt for a cell index" do
    input.string = "1\n"
    ui.read_cell(board)
    expect(output.string).to include(UI::CELL)
  end

  it "reads a cell index from prompt" do
    input.string = "1\n"
    expect(ui.read_cell(board)).to eq(0)
  end

  it "prints an error message if wrong cell index" do
    input.string = "asdf\n1\n"
    ui.read_cell(board)
    expect(output.string).to include(UI::ERROR_WRONG_INPUT)
  end

  it "keeps asking until valid cell index" do
    input.string = "asdf\n-1\n0\n1000\n1\n"
    expect(ui.read_cell(board)).to eq(0)
    expect(output.string.scan(UI::ERROR_WRONG_INPUT).size).to eq(4)
  end

end
