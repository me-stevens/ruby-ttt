# frozen_string_literal: true

class Player
  attr_reader :mark

  def initialize(ui, mark) # rubocop:disable Naming/UncommunicativeMethodParamName, Metrics/LineLength
    @ui   = ui
    @mark = mark
  end

  def make_move(_board)
    ui.print_turn(mark)
  end

  private

  attr_reader :ui
end
