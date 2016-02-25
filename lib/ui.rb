class UI

  ERROR_WRONG_INPUT = "ERROR: Wrong input. Please try again: "

  def initialize(console, validator)
    @console   = console
    @validator = validator
  end

  def print_board(board)
    board = format_cells(board)
    (0...board.size).each { |i| println(board.row(i).join("\t")) }
  end

  def read_cell(board)
    cell = ""
    loop do
      cell = read
      break if valid_cell?(board.total_cells, cell)
      error_wrong_input
    end
    Integer(cell) - 1
  end

  private

  attr_reader :console, :validator

  def read
    console.read.chomp
  end

  def print(message)
    console.write(message)
  end

  def println(message)
    console.writeln(message)
  end

  def format_cells(board)
    i = 0
    Board.new(board.all.collect { |cell| i += 1; cell == :E ? i : cell }.to_a)
  end

  def valid_cell?(total_cells, cell)
    validator.valid_cell?(total_cells, cell)
  end

  def error_wrong_input
    print(ERROR_WRONG_INPUT)
  end

end
