# Write a class that will display:
# ABC
# xyz

# When the below code is run

class Transform
  def self.lowercase(string)
    string.downcase
  end
  
  def initialize(string)
    @string = string
  end

  def uppercase
    @string.upcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

=begin
Further Exploration
A class method is also, somewhat confusingly, called a "singleton method" (the
term is used in other contexts as well). We don't recommend learning the details
at this time - it may be more confusing than it is helpful - but you should be
aware that you may encounter this term.


=end

