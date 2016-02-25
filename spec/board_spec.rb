require 'board'
require 'marks'

describe Board do

  let(:x) {Marks::X}
  let(:o) {Marks::O}
  let(:e) {Marks::E}

  let(:rows) {[
    [x, o, x],
    [o, x, o],
    [o, o, x]
  ]}
  let(:board) {described_class.new(rows)}

  it "has a size of three if it is a 3X3 board" do
    expect(board.size).to eq(3)
  end

  it "has a total amount of 9 cells if it is a 3x3 board" do
    expect(board.cell_count).to eq(9)
  end

  it "gets cell by index" do
    expect(board.cell(0)).to eq(x)
  end

  it "gets a row of the board" do
    expect(board.row(0)).to eq([x, o, x])
  end

  it "gets a column of the board" do
    expect(board.col(0)).to eq([x, o, o])
  end

  it "gets the diagonal of the board" do
    expect(board.diagonal).to eq([x, x, x])
  end

  it "gets the inverse diagonal of the board" do
    expect(board.inv_diagonal).to eq([x, x, o])
  end

  it "gets the whole board" do
    expect(board.all).to eq(Matrix.rows(rows))
  end

  it "gets the indexes of a type of cell" do
    board = Board.new([[x, e, e], [e, e, e], [e, e, e]])
    expect(board.indexes_of(x)).to eq([0])
    expect(board.indexes_of(e)).to eq([1, 2, 3, 4, 5, 6, 7, 8])
  end

  it "places a mark in the board" do
    updated_rows = [
      [o, o, x],
      [o, x, o],
      [o, o, x]
    ]
    expect(board.place_mark(0, o).all).to eq(Matrix.rows(updated_rows))
  end

  it "detects a full board" do
    expect(board.full?(e)).to eq(true)
  end

  it "detects a win in a row" do
    board = Board.new([[x, x, x], [e, e, e], [e, e, e]])
    expect(board.win?(x)).to eq(true)
  end

  it "detects a non-win in a row" do
    expect(board.win?(o)).to eq(false)
  end

  it "detects a win in a column" do
    board = Board.new([[x, e, e], [x, e, e], [x, e, e]])
    expect(board.win?(x)).to eq(true)
  end

  it "detects a non-win in a column" do
    expect(board.win?(o)).to eq(false)
  end

  it "detects a win in a diagonal" do
    expect(board.win?(x)).to eq(true)
  end

  it "detects a non-win in a diagonal" do
    expect(board.win?(o)).to eq(false)
  end

  it "detects a win in the inverse diagonal" do
    board = Board.new([
      [e, e, x],
      [e, x, e],
      [x, e, e]
    ])
    expect(board.win?(x)).to eq(true)
  end

  it "detects a non-win in the inverse diagonal" do
    expect(board.win?(o)).to eq(false)
  end

end
