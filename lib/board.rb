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

end
