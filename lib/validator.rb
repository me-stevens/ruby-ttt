class Validator

  def is_valid_cell?(empty_cells, input)
    valid_cells(empty_cells).include? input
  end

  private

  def valid_cells(empty_cells)
    empty_cells.map { |empty_cell_index| (empty_cell_index + 1).to_s }
  end

end
