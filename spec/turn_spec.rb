# frozen_string_literal: true

require 'board'
require 'human_player'
require 'turn'
require 'ui'

RSpec.describe Turn do
  let(:ui)     { instance_double(UI).as_null_object }
  let(:board)  { Board.new([%i[E E E], %i[E E E], %i[E E E]]) }
  let(:player) { instance_double(HumanPlayer).as_null_object }
  let(:turn)   { described_class.new(ui) }
  let(:mark)   { :X }

  before do
    allow(player).to receive(:make_move).with(board).and_return(0)
  end

  it 'prints the board' do
    turn.play_next_turn(board, player)
    expect(ui).to have_received(:print_board).with(board)
  end

  it 'asks the player for a cell to place the mark' do
    turn.play_next_turn(board, player)
    expect(player).to have_received(:make_move).with(board)
  end

  it 'places the mark in the board' do
    allow(player).to receive(:mark).and_return(mark)
    expect(turn.play_next_turn(board, player).cell(0)).to eq(mark)
  end

  it 'returns the updated board' do
    rows = [%i[X E E], %i[E E E], %i[E E E]]
    allow(player).to receive(:mark).and_return(mark)
    expect(turn.play_next_turn(board, player).all).to eq(rows)
  end
end
