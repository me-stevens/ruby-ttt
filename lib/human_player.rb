require 'player'

class HumanPlayer < Player

  def make_move(board)
    ui.read_cell(board, mark)
  end

end
