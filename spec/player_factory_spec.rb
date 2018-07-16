# frozen_string_literal: true

require 'marks'
require 'player_factory'
require 'ui'

RSpec.describe PlayerFactory do
  let(:factory) { described_class.new(nil) }

  it 'generates two players' do
    players = factory.create_players(:HUMAN_VS_HUMAN)
    expect(players.size).to eq(2)
  end

  it 'players are created with the right marks' do
    players = factory.create_players(:HUMAN_VS_HUMAN)
    expect(players.first.mark).to eq(Marks::X)
    expect(players.last.mark).to eq(Marks::O)
  end

  it 'generates two human players' do
    players = factory.create_players(:HUMAN_VS_HUMAN)
    expect(players.first.class).to eq(HumanPlayer)
    expect(players.last.class).to eq(HumanPlayer)
  end

  it 'generates a human player and a robot player' do
    players = factory.create_players(:HUMAN_VS_ROBOT)
    expect(players.first.class).to eq(HumanPlayer)
    expect(players.last.class).to eq(RobotPlayer)
  end
end
