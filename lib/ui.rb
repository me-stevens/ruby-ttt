class UI

  def initialize(console)
    @console = console
  end

  def print_board(board)
    board = format_cells(board)
    (0...board.size).each { |i| println(board.row(i).join("\t")) }
  end

  private


  def println(message)
    console.writeln(message)
  end

  def format_cells(board)
    i = 0
    Board.new(board.all.collect { |cell| i += 1; cell == :E ? i : cell }.to_a)
  end

end
