# frozen_string_literal: true

require 'human_player'
require 'robot_player'
require 'options'

class PlayerFactory
  def initialize(ui) # rubocop:disable Naming/UncommunicativeMethodParamName
    @ui = ui
  end

  def create_players(option)
    if option == Options::HUMAN_HUMAN
      human_human
    elsif option == Options::HUMAN_ROBOT
      human_robot
    end
  end

  private

  attr_reader :ui

  def human_human
    [
      HumanPlayer.new(ui, Marks::X),
      HumanPlayer.new(ui, Marks::O)
    ]
  end

  def human_robot
    [
      HumanPlayer.new(ui, Marks::X),
      RobotPlayer.new(ui, Marks::O)
    ]
  end
end
