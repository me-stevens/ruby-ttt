require 'board'

describe Board do

  X = :X
  O = :O
  E = :E

  let(:rows) {[
    [X, O, X],
    [O, X, O],
    [O, O, X]
  ]}
  let(:board) {described_class.new(rows)}

  it "has a size of three if it is a 3X3 board" do
    expect(board.size).to eq(3)
  end

  it "has a total amount of 9 cells if it is a 3x3 board" do
    expect(board.total_cells).to eq(9)
  end

end
