require 'human_player'

class TTT

  def initialize(ui, game, factory)
    @ui      = ui
    @game    = game
    @factory = factory
  end

  def run
    play_games
    bye
  end

  private

  attr_reader :ui, :game, :factory

  def replay?
    ui.replay?
  end

  def bye
    ui.bye
  end

  def play(player, opponent)
    game.play(player, opponent)
  end

  def create_players(ui, option)
    factory.create_players(ui, option)
  end

  def play_games
    loop do
      players = create_players(ui, :HUMAN_VS_HUMAN)
      play(players.first, players.last)
      break unless replay?
    end
  end

end
