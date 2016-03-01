require 'marks'

class UI

  CLEAR = "\033[H\033[2J"
  TURN  = "\nTURN OF "
  CELL  = "\nChoose a cell to place the mark: "
  WIN   = "\nCongratulations, "
  DRAW  = "\nIt's a draw!"

  REPLAY = "\nReplay? (y/n): "
  YES    = "y"
  BYE    = "\nByyeeee!"

  ERROR_WRONG_INPUT = "ERROR: Wrong input. Please try again: "

  def initialize(console)
    @console = console
  end

  def clear
    print(CLEAR)
  end

  def print_board(board)
    clear
    format_cells(board).each { |row| println(row.join("\t")) }
  end

  def read_cell(board, mark)
    print(TURN + mark.to_s)
    Integer(valid_cell(board)) - 1
  end

  def print_win_message(mark)
    println(WIN + mark.to_s)
  end

  def print_draw_message
    println(DRAW)
  end

  def replay?
    ask_for(REPLAY).downcase == YES
  end

  def bye
    println(BYE)
  end

  private

  attr_reader :console

  def read
    console.read.chomp
  end

  def print(message)
    console.write(message)
  end

  def println(message = "")
    console.writeln(message)
  end

  def is_valid_cell?(board, cell)
    valid_cells(board.indexes_of(Marks::E)).include? cell
  end

  def valid_cells(empty_cells)
    empty_cells.map { |empty_cell_index| (empty_cell_index + 1).to_s }
  end

  def format_cells(board)
    board.all.flatten.each_with_index.reduce([]) do |formatted_cell, (cell, i)|
      formatted_cell << (cell == Marks::E ? i+1 : cell)
    end.each_slice(board.size).to_a
  end

  def ask_for(question)
    print(question)
    read
  end

  def valid_cell(board)
    cell = ask_for(CELL)
    loop do
      break if is_valid_cell?(board, cell)
      error_wrong_input
      cell = read
    end
    cell
  end

  def error_wrong_input
    print(ERROR_WRONG_INPUT)
  end

end
