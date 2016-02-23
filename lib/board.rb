require 'matrix'

class Board

  def initialize(rows)
    @board = Matrix.rows(rows)
  end

  def size
    board.row_count
  end

  def total_cells
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

  def diag
    board.each(:diagonal).to_a
  end

  def inv_diag
    mirror.diag
  end

  def cells_with(content)
    indexes = []
    board.each_with_index { |cell, row, col| indexes << index_from(row, col) if cell == content }
    indexes
  end

  def full?(empty_mark)
    cells_with(empty_mark).size == 0
  end

  def win?(player_mark)
    win_in_rows(player_mark) || win_in_cols(player_mark) || win_in_diag(player_mark) || win_in_inv_diag(player_mark)
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

  def win_in_row(index, mark)
    row(index).each { |cell| return false if cell != mark }
    true
  end

  def win_in_rows(mark)
    (0...size).each { |index| return true if win_in_row(index, mark) }
    false
  end

  def win_in_col(index, mark)
    col(index).each { |cell| return false if cell != mark }
    true
  end

  def win_in_cols(mark)
    (0...size).each { |index| return true if win_in_col(index, mark) }
    false
  end

  def win_in_diag(mark)
    diag.each { |cell| return false if cell != mark }
    true
  end

  def win_in_inv_diag(mark)
    inv_diag.each { |cell| return false if cell != mark }
    true
  end

end
