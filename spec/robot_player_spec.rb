require 'board'
require 'robot_player'
require 'ui'

describe RobotPlayer do

  let(:ui)    {instance_double(UI).as_null_object}
  let(:robot) {described_class.new(ui, :O)}

  it "subclasses the player class so gets the mark" do
    expect(robot.mark).to eq(:O)
  end

  it "prints the turn" do
    board = Board.new([[:E, :E, :E], [:E, :E, :E], [:E, :E, :E]])
    robot.make_move(board)
    expect(ui).to have_received(:print_turn).with(:O)
  end

end
