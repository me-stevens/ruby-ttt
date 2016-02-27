require 'console'

describe Console do

  let(:output) {StringIO.new}

  it "prints to the console" do
    console = described_class.new(nil, output)
    console.write("boo")
		
    expect(output.string).to eq("boo")
  end

  it "prints nothing by default if there is no message" do
    console = described_class.new(nil, output)
    console.write

    expect(output.string).to eq("")
  end

  it "prints a line to the console" do
    console = described_class.new(nil, output)
    console.writeln("boo")

    expect(output.string).to eq("boo\n")
  end

  it "prints an empty line by default if there is no message" do
    console = described_class.new(nil, output)
    console.writeln

    expect(output.string).to eq("\n")
  end

  it "reads from console" do
    input   = StringIO.new("hello\n")
    console = described_class.new(input, nil)
		
    expect(console.read()).to eq("hello\n")
  end

end