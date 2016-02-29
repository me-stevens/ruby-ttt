require 'matrix'

class Board

  def initialize(rows)
    @board = Matrix.rows(rows)
  end

  def size
    board.row_count
  end

  def cell_count
    size * size
  end

  def cell(index)
    board[row_from(index), column_from(index)]
  end

  def row(index)
    board.row(index).to_a
  end

  def column(index)
    board.column(index).to_a
  end

  def diagonal
    board.each(:diagonal).to_a
  end

  def inverse_diagonal
    reverse.diagonal
  end

  def all
    board.to_a
  end

  def indexes_of(content)
    all.flatten.each_with_index.map { |cell, index| index if cell == content }.compact
  end

  def place_mark(cell, mark)
    new_rows = all
    new_rows[row_from(cell)][column_from(cell)] = mark
    Board.new(new_rows)
  end

  def full?(empty_mark)
    indexes_of(empty_mark).count == 0
  end

  def win?(player_mark)
    win_in_rows?(player_mark) || win_in_columns?(player_mark) || win_in?(diagonal, player_mark) || win_in?(inverse_diagonal, player_mark)
  end

  def clear(empty_mark)
    Board.new(Matrix.build(size) { empty_mark }.to_a)
  end

  private

  attr_reader :board

  def reverse
    Board.new(all.map { |row| row.reverse })
  end

  def row_from(index)
    index / board.column_count
  end

  def column_from(index)
    index % board.column_count
  end

  def index_from(row, column)
    index = row * board.column_count + column
  end

  def win_in?(line, mark)
    line.all? { |cell| cell == mark }
  end

  def win_in_rows?(mark)
    (0...size).any? { |index| win_in?(row(index), mark) }
  end

  def win_in_columns?(mark)
    (0...size).any? { |index| win_in?(column(index), mark) }
  end

end
