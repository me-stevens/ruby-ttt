require 'ui'
require 'game'
require 'ttt'

describe TTT do

  let(:ui)   {instance_double(UI).as_null_object}
  let(:game) {instance_double(Game).as_null_object}
  let(:ttt)  {described_class.new(ui, game)}

  it "plays one game" do
    allow(ui).to receive(:replay?).and_return(false)
    ttt.run
    expect(game).to have_received(:play).once
  end

  it "plays several games" do
    allow(ui).to receive(:replay?).and_return(true, true, false)
    ttt.run
    expect(game).to have_received(:play).exactly(3).times
  end

  it "prints a goodbye message" do
    allow(ui).to receive(:replay?).and_return(false)
    ttt.run
    expect(ui).to have_received(:bye).once
  end

end
