class Validator

  def is_valid_cell?(cell_count, input)
    valid_cells(cell_count).include? input
  end

  private

  def valid_cells(cell_count)
    inputs = []
    (1..cell_count).each { |i| inputs << i.to_s }
    inputs
  end

end