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

  it "gets cell by index" do
    expect(board.cell(0)).to eq(X)
  end

  it "gets a row of the board" do
    expect(board.row(0)).to eq([X, O, X])
  end

  it "gets a column of the board" do
    expect(board.col(0)).to eq([X, O, O])
  end

  it "gets the diagonal of the board" do
    expect(board.diag).to eq([X, X, X])
  end

  it "gets the inverse diagonal of the board" do
    expect(board.inv_diag).to eq([X, X, O])
  end

end
