class Validator

  def valid_cell?(total_cells, input)
    valid_cells(total_cells).include? input
  end

  private

  def valid_cells(total)
    inputs = []
    (1..total).each { |i| inputs << i.to_s }
    inputs
  end

end
