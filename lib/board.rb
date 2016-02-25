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
    board[row_from(index), col_from(index)]
  end

  def row(index)
    board.row(index).to_a
  end

  def col(index)
    board.column(index).to_a
  end

  def diagonal
    board.each(:diagonal).to_a
  end

  def inv_diagonal
    mirror.diagonal
  end

  def all
    board
  end

  def indexes_of(content)
    indexes = []
    board.each_with_index { |cell, row, col| indexes << index_from(row, col) if cell == content }
    indexes
  end

  def full?(empty_mark)
    indexes_of(empty_mark).count == 0
  end

  def win?(player_mark)
    win_in_rows(player_mark) || win_in_cols(player_mark) || win_in(diagonal, player_mark) || win_in(inv_diagonal, player_mark)
  end

  private

  attr_reader :board

  def mirror
    Board.new(board.to_a.map { |row| row.reverse })
  end

  def row_from(index)
    index / board.column_count
  end

  def col_from(index)
    index % board.column_count
  end

  def index_from(row, col)
    index = row * board.column_count + col
  end

  def win_in(line, mark)
    line.each { |cell| return false if cell != mark }
    true
  end

  def win_in_rows(mark)
    (0...size).each { |index| return true if win_in(row(index), mark) }
    false
  end

  def win_in_cols(mark)
    (0...size).each { |index| return true if win_in(col(index), mark) }
    false
  end

end
