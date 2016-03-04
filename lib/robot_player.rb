require 'marks'
require 'player'

class RobotPlayer < Player

  def make_move(board)
    super
    minimax(board, mark).first
  end

  def minimax(current_board, current_player)
    index = initialize_index(current_board)
    score = initialize_score(current_player)


    [index, score]
  end

  def initialize_index(current_board) # not sure about this
    current_board.cell_count
  end

  def initialize_score(current_player)
    current_player == mark ? -100 : 100
  end

  def empty_cells(current_board)
    current_board.indexes_of(Marks::E)
  end

  def game_is_not_over?(temp_board, current_player)
    !game_over?(temp_board, current_player)
  end

  def heuristics(temp_board, current_player)
    if temp_board.win?(mark)
      current_player == mark ? 10 : -10
    else
      0
    end
  end

  def better_score?(current_player, temp_score, score)
    (current_player == mark && temp_score > score) ||
    (current_player != mark && temp_score < score)
  end

  private

  def game_over?(temp_board, current_player)
    temp_board.win?(current_player) || temp_board.full?(Marks::E)
  end

end