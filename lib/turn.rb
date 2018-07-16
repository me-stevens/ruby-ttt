# frozen_string_literal: true

class Turn
  def initialize(ui) # rubocop:disable Naming/UncommunicativeMethodParamName
    @ui = ui
  end

  def play_next_turn(board, player)
    @board  = board
    @player = player
    print_board
    place_mark
  end

  private

  attr_reader :ui, :board, :player

  def print_board
    ui.print_board(board)
  end

  def move
    player.make_move(board)
  end

  def mark
    player.mark
  end

  def place_mark
    board.place_mark(move, mark)
  end
end
