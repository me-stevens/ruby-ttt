require 'validator'

describe Validator do

  let(:validator) {described_class.new}

  it "detects an invalid cell index" do
    valid_cells = ["1", "2", "3", "4"]
    expect(validator.valid_cell?(valid_cells.size, "asdf")).to eq(false)
    expect(validator.valid_cell?(valid_cells.size, "-1")).to eq(false)
    expect(validator.valid_cell?(valid_cells.size, "0")).to eq(false)
    expect(validator.valid_cell?(valid_cells.size, "5")).to eq(false)
  end

  it "detects an invalid cell index" do
    valid_cells = ["1", "2", "3", "4"]
    expect(validator.valid_cell?(valid_cells.size, "1")).to eq(true)
    expect(validator.valid_cell?(valid_cells.size, "2")).to eq(true)
    expect(validator.valid_cell?(valid_cells.size, "3")).to eq(true)
    expect(validator.valid_cell?(valid_cells.size, "4")).to eq(true)
  end

end
