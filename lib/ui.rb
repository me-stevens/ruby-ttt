class UI

  CELL = "\nChoose a cell to place the mark: "
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
    Integer(valid_cell(board)) - 1
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

  def is_valid_cell?(cell_count, cell)
    validator.is_valid_cell?(cell_count, cell)
  end

  def format_cells(board)
    i = 0
    Board.new(board.all.collect { |cell| i += 1; cell == :E ? i : cell }.to_a)
  end

  def ask_for(question)
    print(question)
    read
  end

  def valid_cell(board)
    cell = ask_for(CELL)
    loop do
      break if is_valid_cell?(board.cell_count, cell)
      error_wrong_input
      cell = read
    end
    cell
  end

  def error_wrong_input
    print(ERROR_WRONG_INPUT)
  end

end
