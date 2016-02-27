require 'marks'

class Game

  include Marks

  def initialize(ui, board, turn)
    @ui    = ui
    @board = board
    @turn  = turn
    @mark  = X
  end

  def play
    play_until_game_over
    print_game_over_message
  end

  private

  attr_reader :ui, :board, :turn, :mark

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
    board.full?(E)
  end

  def play_next_turn
    turn.play_next_turn(board, mark)
  end

  def opponent
    Marks.opponent(mark)
  end

  def play_until_game_over
    loop do
      @board = play_next_turn
      break if game_over
      @mark  = opponent
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