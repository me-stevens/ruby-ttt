require 'matrix'

class Board

  def initialize(rows)
    @board = rows
  end

  def size
    board.size
  end

  def cell_count
    size * size
  end

  def cell(index)
    board[row_from(index)][column_from(index)]
  end

  def row(index)
    board[index]
  end

  def column(index)
    board.map { |row| row[index] }
  end

  def diagonal
    board.map.with_index { |row, index| row[index] }
  end

  def inverse_diagonal
    reverse.diagonal
  end

  def all
    board
  end

  def indexes_of(content)
    board.flatten.map.with_index { |cell, index| index if cell == content }.compact
  end

  def place_mark(cell, mark)
    rows = board
    rows[row_from(cell)][column_from(cell)] = mark
    Board.new(rows)
  end

  def full?(empty_mark)
    indexes_of(empty_mark).count == 0
  end

  def win?(player_mark)
    win_in_rows?(player_mark) || win_in_columns?(player_mark) || win_in?(diagonal, player_mark) || win_in?(inverse_diagonal, player_mark)
  end

  def clear(empty_mark)
    Board.new(Array.new(cell_count, empty_mark).each_slice(size).to_a)
  end

  private

  attr_reader :board

  def reverse
    Board.new(board.map { |row| row.reverse })
  end

  def row_from(index)
    index / board.size
  end

  def column_from(index)
    index % board.size
  end

  def index_from(row, column)
    index = row * board.size + column
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
