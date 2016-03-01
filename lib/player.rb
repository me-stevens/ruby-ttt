class Player

  def initialize(ui, chip)
    @ui   = ui
    @chip = chip
  end

  def mark
    chip
  end

  private

  attr_reader :ui, :chip

end

