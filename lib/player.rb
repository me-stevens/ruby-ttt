class Player

  attr_reader :mark

  def initialize(ui, mark)
    @ui   = ui
    @mark = mark
  end

  def make_move(board)
    ui.print_turn(mark)
  end

  private

  attr_reader :ui

end
