# What is wrong with the following code? What fix(es) would you make?
# Problem 1: we're calling `expand(3)` on self when expand is a private method
# Problem 2: within the definition of `expand` we're accessing the @string instance
# variable directly when we should use a getter method.

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  def expand(n)
    string * n
  end

  attr_reader :string
end

expander = Expander.new('xyz')
puts expander