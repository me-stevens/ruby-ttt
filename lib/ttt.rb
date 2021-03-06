# frozen_string_literal: true

require 'human_player'

class TTT
  def initialize(ui, game, factory) # rubocop:disable Naming/UncommunicativeMethodParamName, Metrics/LineLength
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

  def create_players(option)
    factory.create_players(option)
  end

  def play_games
    loop do
      players = create_players(:HUMAN_VS_ROBOT)
      play(players.first, players.last)
      break unless replay?
    end
  end
end
