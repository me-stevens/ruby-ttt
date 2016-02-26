require 'validator'

describe Validator do

  let(:validator) {described_class.new}

  it "detects an valid cell index" do
    empty_cells = [1, 2, 3, 4]
    expect(validator.is_valid_cell?(empty_cells, "2")).to eq(true)
    expect(validator.is_valid_cell?(empty_cells, "3")).to eq(true)
    expect(validator.is_valid_cell?(empty_cells, "4")).to eq(true)
    expect(validator.is_valid_cell?(empty_cells, "5")).to eq(true)
  end

  it "detects an invalid cell index" do
    empty_cells = [1, 2, 3, 4]
    expect(validator.is_valid_cell?(empty_cells, "asdf")).to eq(false)
    expect(validator.is_valid_cell?(empty_cells, "-1")).to eq(false)
    expect(validator.is_valid_cell?(empty_cells, "1")).to eq(false)
    expect(validator.is_valid_cell?(empty_cells, "6")).to eq(false)
  end

end