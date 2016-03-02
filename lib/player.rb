class Player

  attr_reader :mark

  def initialize(ui, mark)
    @ui   = ui
    @mark = mark
  end

  private

  attr_reader :ui

end