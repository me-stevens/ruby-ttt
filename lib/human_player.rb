# frozen_string_literal: true

require 'player'

class HumanPlayer < Player
  def make_move(board)
    super
    read_cell(board)
  end

  private

  def read_cell(board)
    ui.read_cell(board)
  end
end
