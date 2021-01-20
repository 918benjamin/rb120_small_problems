=begin
Modify the House class so the program outputs this:
Home 1 is cheaper
Home 2 is more expensive

You are permitted to define only one new method in House.
=end

### My initial solution just changing the comparison to price outside the class definition
# class House
#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1.price < home2.price
# puts "Home 2 is more expensive" if home2.price > home1.price

### LS solution by including the Comparable module
class House
  attr_reader :price
  include Comparable

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1
p home1 < home2

=begin
Further Exploration
Is the technique we employ here to make House objects comparable a good one?
(Hint: is there a natural way to compare Houses? Is price the only criteria you might use?)
It seems fine, except that we can explicitly compare House object prices by
invoking home_object.price which returns an integer which has its own <=> comparison
method implementation.

What problems might you run into, if any?
You might forget to compare the prices explicitly. 
If you use Comparable then you are always comparing two objects of that class on
the same attribute

Can you think of any sort of classes where including Comparable is a good idea?
Classes where you want to compare them based on a single, fixed attribute (like price)
or classes which include only one single attribute (seems like that would be uncommon)
