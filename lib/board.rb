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

  private

  attr_reader :board


  def row_from(index)
    index / board.column_count
  end

  def col_from(index)
    index % board.column_count
  end

end
