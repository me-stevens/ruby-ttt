class Turn

  def initialize(ui)
    @ui = ui
  end

  def play_next_turn(board, mark)
    @board = board
    print_board
    place_mark(mark)
  end

  private

  attr_reader :ui, :board

  def print_board
    ui.print_board(board)
  end

  def read_cell(mark)
    ui.read_cell(board, mark)
  end

  def place_mark(mark)
    board.place_mark(read_cell(mark), mark)
  end

end
