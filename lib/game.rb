require 'marks'

class Game

  def initialize(ui, board, turn)
    @ui    = ui
    @board = board
    @turn  = turn
  end

  def play(player1, player2)
    @player1 = player1
    @player2 = player2
    play_until_game_over
    print_game_over_message
    clear_board
  end

  private

  attr_reader :ui, :board, :turn, :player, :player1, :player2

  def print_board
    ui.print_board(board)
  end

  def print_win_message
    ui.print_win_message(mark)
  end

  def print_draw_message
    ui.print_draw_message
  end

  def win?
    board.win?(mark)
  end

  def full?
    board.full?(Marks::E)
  end

  def clear_board
    @board = board.clear(Marks::E)
  end

  def mark
    player.mark
  end

  def play_next_turn
    turn.play_next_turn(board, player)
  end

  def opponent
    player == player1 ? player2 : player1
  end

  def play_until_game_over
    @player = player1
    loop do
      @board  = play_next_turn
      break if game_over
      @player = opponent
    end
  end

  def game_over
    win? || full?
  end

  def print_game_over_message
    print_board
    win? ? print_win_message : print_draw_message
  end

end
