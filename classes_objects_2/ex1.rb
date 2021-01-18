# Modify the following code so that Hello! I'm a cat! is printed when
# Cat.generic_greeting is invoked.

# Expected output
# Hello! I'm a cat!

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

# Further exploration
# hat happens if you run kitty.class.generic_greeting? Can you explain this result?

kitty = Cat.new
# kitty.generic_greeting # raises an exception because generic_greeting is a
  # class method, not an instance method, and here the receiver is an instance
kitty.class.generic_greeting # this should work just fine because we're invoking
  # the generic_greeting class method on the return value of kitty.class which
  # is the class itself
