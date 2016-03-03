require 'human_player'
require 'robot_player'
require 'options'

class PlayerFactory

  def initialize(ui)
    @ui = ui
  end

  def create_players(option)
    if (option == Options::HUMAN_HUMAN)
      [
        HumanPlayer.new(ui, Marks::X),
        HumanPlayer.new(ui, Marks::O)
      ]
    elsif (option == Options::HUMAN_ROBOT)
      [
        HumanPlayer.new(ui, Marks::X),
        RobotPlayer.new(ui, Marks::O)
      ]
    end
  end

  private

  attr_reader :ui

end
