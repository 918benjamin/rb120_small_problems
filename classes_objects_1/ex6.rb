# Using the code from the previous exercise, move the greeting from the
#initialize method to an instance method named #greet that prints a greeting when invoked.

# Expected output:
# Hello! My name is Sophie!

### Option 1 - manual getter
# class Cat
#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end

#   def greet
#     puts "Hello! My name is #{name}!"
#   end
# end

### Option 2 - Attr_reader getter
class Cat
  attr_reader :name 

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet