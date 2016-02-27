class TTT

  def initialize(ui, game)
    @ui   = ui
    @game = game
  end

  def run
    play_games
    bye
  end

  private

  attr_reader :ui, :game

  def replay?
    ui.replay?
  end

  def bye
    ui.bye
  end

  def play
    game.play
  end

  def play_games
    loop do
      play
      break unless replay?
    end
  end

end
