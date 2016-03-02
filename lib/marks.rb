module Marks
  X = :X
  O = :O
  E = :E

  def self.opponent(mark)
    mark == X ? O : X
  end

end
