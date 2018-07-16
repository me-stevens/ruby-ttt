require 'board'
require 'robot_player'
require 'ui'

RSpec.describe RobotPlayer do

  let(:ui)    {instance_double(UI).as_null_object}
  let(:board) {Board.new([
    [:X, :O, :X],
    [:O, :X, :O],
    [:O, :E, :X]
  ])}
  let(:robot) {described_class.new(ui, :O)}

  it "subclasses the player class so gets the mark" do
    expect(robot.mark).to eq(:O)
  end

  it "prints the turn" do
    robot.make_move(board)
    expect(ui).to have_received(:print_turn).with(:O)
  end

  it "initializes the index to the board cell count in every change of player" do
    expect(robot.initialize_index(board)).to eq(9)
  end

  it "initializes the score to -100 if current player is robot" do
    expect(robot.initialize_score(:O)).to eq(-100)
  end

  it "initializes the score to 100 if current player is robot's opponent" do
    expect(robot.initialize_score(:X)).to eq(100)
  end

  it "returns the empty cell indexes of the board" do
    expect(robot.empty_cells(board)).to eq([7])
  end

  it "game is not over if board is not full or has no winner" do
    expect(robot.game_is_not_over?(board, :O)).to eq(true)
  end

  it "game is over if board has winner" do
    expect(robot.game_is_not_over?(board, :X)).to eq(false)
  end

  it "heuristics are zero if there is no win" do
    expect(robot.heuristics(board, :O)).to eq(0)
  end

  it "heuristics are 10 for the robot if there is a robot win" do
    board = Board.new([[:O, :O, :O], [:E, :E, :E], [:E, :E, :E]])
    expect(robot.heuristics(board, :O)).to eq(10)
  end

  it "heuristics are -10 for the opponent if there is an opponent win" do
    board = Board.new([[:X, :X, :X], [:E, :E, :E], [:E, :E, :E]])
    expect(robot.heuristics(board, :X)).to eq(-10)
  end

  it "score is better if its a robot and temp score is bigger than current score" do
    temp_score = 10
    score      = 0
    expect(robot.better_score?(:O, temp_score, score)).to eq(true)
  end

  it "score is not better if its a robot and temp score is lower than current score" do
    temp_score = 0
    score      = 10
    expect(robot.better_score?(:O, temp_score, score)).to eq(false)
  end

  it "score is better if its not a robot and temp score is lower than current score" do
    temp_score = 0
    score      = 10
    expect(robot.better_score?(:X, temp_score, score)).to eq(true)
  end

  it "score is not better if its not a robot and temp score is higher than current score" do
    temp_score = 10
    score      = 0
    expect(robot.better_score?(:X, temp_score, score)).to eq(false)
  end

  it "should place the mark in the only available spot" do
    expect(robot.make_move(board)).to eq(7)
  end

  it "should place the mark in the winning position for rows" do
    board = Board.new([
      [:O, :O, :E],
      [:X, :X, :O],
      [:E, :X, :X]
    ])
    expect(robot.make_move(board)).to eq(2)
  end

  it "should block the opponent from winning in rows" do
    board = Board.new([
      [:X, :E, :X],
      [:X, :O, :O],
      [:E, :X, :O]
    ])
    expect(robot.make_move(board)).to eq(1)
  end

  it "should place the mark in the winning position for columns" do
    board = Board.new([
      [:O, :X, :O],
      [:X, :E, :O],
      [:X, :X, :E]
    ])
    expect(robot.make_move(board)).to eq(8)
  end

  it "should block the opponent from winning in columns" do
    board = Board.new([
      [:X, :O, :X],
      [:X, :O, :O],
      [:E, :X, :E]
    ])
    expect(robot.make_move(board)).to eq(6)
  end

  it "should place the mark in the winning position for diagonal" do
    board = Board.new([
      [:O, :X, :X],
      [:X, :O, :O],
      [:E, :X, :E]
    ])
    expect(robot.make_move(board)).to eq(8)
  end

  it "should place the mark in the winning position for inverse diagonal" do
    board = Board.new([
      [:X, :X, :O],
      [:O, :O, :X],
      [:E, :X, :E]
    ])
    expect(robot.make_move(board)).to eq(6)
  end

end
