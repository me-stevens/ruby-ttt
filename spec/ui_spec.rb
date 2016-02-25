require 'console'
require 'ui'
require 'board'

describe UI do

  X = :X
  O = :O
  E = :E

  let(:input)  {StringIO.new}
  let(:output) {StringIO.new}
  let(:ui)     {described_class.new(Console.new(input, output))}

  it "prints a board with format" do
    board = Board.new([
      [X, O, X],
      [O, X, O],
      [O, O, X]
    ])
    ui.print_board(board)
    expect(output.string).to eq("X\tO\tX\nO\tX\tO\nO\tO\tX\n")
  end

end
