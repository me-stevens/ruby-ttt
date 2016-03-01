require 'player'

class HumanPlayer < Player

  def make_move(board)
    print_turn
    read_cell(board)
  end

  private

  def print_turn
    ui.print_turn(mark)
  end

  def read_cell(board)
    ui.read_cell(board)
  end

end
