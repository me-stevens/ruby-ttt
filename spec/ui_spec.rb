require 'console'
require 'ui'
require 'board'
require 'marks'

describe UI do

  let(:x) {Marks::X}
  let(:o) {Marks::O}
  let(:e) {Marks::E}

  let(:input)  {StringIO.new}
  let(:output) {StringIO.new}
  let(:ui)     {described_class.new(Console.new(input, output))}

  it "prints a board with format" do
    board = Board.new([
      [x, o, x],
      [o, x, o],
      [o, o, x]
    ])
    ui.print_board(board)
    expect(output.string).to eq("X\tO\tX\nO\tX\tO\nO\tO\tX\n")
  end

end
