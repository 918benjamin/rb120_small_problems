# Update this code so that when you run it, you see the following output:
# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  attr_reader :name, :age, :color

  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{name} is #{age} years old and has #{color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

=begin
Further Exploration
An alternative approach to this problem would be to modify the Pet class to
accept a colors parameter. If we did this, we wouldn't need to supply an
initialize method for Cat.

Why would we be able to omit the initialize method?
Because the Cat class would have an identical initialize method to Pet class,
so we can just use the inherited initialize method.

Would it be a good idea to modify Pet in this way? Why or why not?
It might be a good idea if all subclasses of Pet have a color. If not, then we
shouldn't modify the Pet initialize method because this will create an additional
required argument for every instance of a subclass of Pet (and instance of Pet).

How might you deal with some of the problems, if any, that might arise from modifying Pet?
We could set a default value for the color parameter in Pet's initialize method.


=end