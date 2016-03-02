class PlayerFactory

  def initialize(ui)
    @ui = ui
  end

  def create_players(option)
    if (option == :HUMAN_VS_HUMAN)
      [
        HumanPlayer.new(ui, Marks::X),
        HumanPlayer.new(ui, Marks::O)
      ]
    end
  end

  private

  attr_reader :ui

end
