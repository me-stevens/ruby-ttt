require 'marks'

RSpec.describe Marks do

  it "swaps X to O" do
    mark = Marks::X
    expect(Marks.opponent(mark)).to eq(Marks::O)
  end

  it "swaps O to X" do
    mark = Marks::O
    expect(Marks.opponent(mark)).to eq(Marks::X)
  end

end
