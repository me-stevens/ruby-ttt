class PlayerFactory

  def create_players(ui, option)
    if (option == :HUMAN_VS_HUMAN)
      [
        HumanPlayer.new(ui, Marks::X),
        HumanPlayer.new(ui, Marks::O)
      ]
    end
  end

end
