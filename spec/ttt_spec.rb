# frozen_string_literal: true

require 'game'
require 'player_factory'
require 'ttt'
require 'ui'

RSpec.describe TTT do
  let(:ui)      { instance_double(UI).as_null_object }
  let(:game)    { instance_double(Game).as_null_object }
  let(:factory) { PlayerFactory.new(ui) }
  let(:ttt)     { described_class.new(ui, game, factory) }

  it 'plays one game' do
    allow(ui).to receive(:replay?).and_return(false)
    ttt.run
    expect(game).to have_received(:play).once
  end

  it 'plays several games' do
    allow(ui).to receive(:replay?).and_return(true, true, false)
    ttt.run
    expect(game).to have_received(:play).exactly(3).times
  end

  it 'prints a goodbye message' do
    allow(ui).to receive(:replay?).and_return(false)
    ttt.run
    expect(ui).to have_received(:bye).once
  end
end
