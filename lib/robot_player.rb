# frozen_string_literal: true

require 'marks'
require 'player'

class RobotPlayer < Player
  def make_move(board)
    super
    minimax(board, mark).first
  end

  def minimax(current_board, current_player) # rubocop:disable Metrics/MethodLength, Metrics/LineLength
    index = initialize_index(current_board)
    score = initialize_score(current_player)

    empty_cells(current_board).each do |empty|
      temp_index = empty
      temp_board = current_board.place_mark(temp_index, current_player)
      temp_score = temp_score(temp_board, current_player)

      if better_score?(current_player, temp_score, score)
        index = temp_index
        score = temp_score
      end
    end

    [index, score]
  end

  def initialize_index(current_board)
    # not sure about this
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
    if temp_board.win?(current_player)
      win_heuristics(current_player)
    else
      draw_heuristics
    end
  end

  def better_score?(current_player, temp_score, score)
    (current_player == mark && temp_score > score) ||
      (current_player != mark && temp_score < score)
  end

  private

  def temp_score(temp_board, current_player)
    if game_is_not_over?(temp_board, current_player)
      minimax(temp_board, Marks.opponent(current_player)).last
    else
      heuristics(temp_board, current_player)
    end
  end

  def game_over?(temp_board, current_player)
    temp_board.win?(current_player) || temp_board.full?(Marks::E)
  end

  def win_heuristics(current_player)
    current_player == mark ? 10 : -10
  end

  def draw_heuristics
    0
  end
end
