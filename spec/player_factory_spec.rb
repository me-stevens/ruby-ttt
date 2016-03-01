require 'marks'
require 'player_factory'
require 'ui'

describe PlayerFactory do

  let(:ui)      {instance_double(UI).as_null_object}
  let(:factory) {described_class.new}

  it "generates two players" do
    players = factory.create_players(ui, :HUMAN_VS_HUMAN)
    expect(players.size).to eq(2)
  end

  it "players are created with the right marks" do
    players = factory.create_players(ui, :HUMAN_VS_HUMAN)
    expect(players.first.mark).to eq(Marks::X)
    expect(players.last.mark).to eq(Marks::O)
  end

  it "generates two human players" do
    players = factory.create_players(ui, :HUMAN_VS_HUMAN)
    expect(players.first.class).to eq(HumanPlayer)
    expect(players.last.class).to eq(HumanPlayer)
  end

end
