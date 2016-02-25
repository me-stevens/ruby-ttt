class UI

  def initialize(console)
    @console = console
  end

  def print_board(board)
    (0...board.size).each { |i| console.writeln(board.row(i).join("\t")) }
  end

  private

  attr_reader :console

end
