# frozen_string_literal: true

require 'board'

RSpec.describe Board do
  let(:rows) do
    [
      %i[X O X],
      %i[O X O],
      %i[O O X]
    ]
  end
  let(:board) { described_class.new(rows) }

  it 'has a size of three if it is a 3X3 board' do
    expect(board.size).to eq(3)
  end

  it 'has a total amount of 9 cells if it is a 3x3 board' do
    expect(board.cell_count).to eq(9)
  end

  it 'gets cell by index' do
    expect(board.cell(0)).to eq(:X)
  end

  it 'gets a row of the board' do
    expect(board.row(0)).to eq(%i[X O X])
  end

  it 'gets a column of the board' do
    expect(board.column(0)).to eq(%i[X O O])
  end

  it 'gets the diagonal of the board' do
    expect(board.diagonal).to eq(%i[X X X])
  end

  it 'gets the inverse diagonal of the board' do
    expect(board.inverse_diagonal).to eq(%i[X X O])
  end

  it 'gets the whole board' do
    expect(board.all).to eq(rows)
  end

  it 'gets the indexes of a type of cell' do
    board = Board.new([%i[X E E], %i[E E E], %i[E E E]])
    expect(board.indexes_of(:X)).to eq([0])
    expect(board.indexes_of(:E)).to eq([1, 2, 3, 4, 5, 6, 7, 8])
  end

  it 'places a mark in the board' do
    updated_rows = [
      %i[O O X],
      %i[O X O],
      %i[O O X]
    ]
    expect(board.place_mark(0, :O).all).to eq(updated_rows)
  end

  it "doesn't modify the content of the previous board when placing a mark" do
    updated_rows = [
      %i[O O X],
      %i[O X O],
      %i[O O X]
    ]
    expect(rows).not_to eq(updated_rows)
  end

  it 'detects a full board' do
    expect(board.full?(:E)).to eq(true)
  end

  it 'detects a win in a row' do
    board = Board.new([%i[X X X], %i[E E E], %i[E E E]])
    expect(board.win?(:X)).to eq(true)
  end

  it 'detects a non-win in a row' do
    expect(board.win?(:O)).to eq(false)
  end

  it 'detects a win in a column' do
    board = Board.new([%i[X E E], %i[X E E], %i[X E E]])
    expect(board.win?(:X)).to eq(true)
  end

  it 'detects a non-win in a column' do
    expect(board.win?(:O)).to eq(false)
  end

  it 'detects a win in a diagonal' do
    expect(board.win?(:X)).to eq(true)
  end

  it 'detects a non-win in a diagonal' do
    expect(board.win?(:O)).to eq(false)
  end

  it 'detects a win in the inverse diagonal' do
    board = Board.new([
                        %i[E E X],
                        %i[E X E],
                        %i[X E E]
                      ])
    expect(board.win?(:X)).to eq(true)
  end

  it 'detects a non-win in the inverse diagonal' do
    expect(board.win?(:O)).to eq(false)
  end

  it 'clears the board' do
    empty = [%i[E E E], %i[E E E], %i[E E E]]
    expect(board.clear(:E).all).to eq(empty)
  end
end
