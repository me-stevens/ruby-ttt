require 'player'

class RobotPlayer < Player

  def make_move(board)
    super
    read_cell(board)
  end

  private

  def read_cell(board)
    minimax(board, mark)
  end

  def minimax(current_board, current_player)
  end
end
