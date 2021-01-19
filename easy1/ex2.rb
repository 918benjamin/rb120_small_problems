=begin
What output does this code print?
Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

Output:
  => Fluffy
  => My name is FLUFFY
  => FLUFFY
  => FLUFFY
Why:

=end

class Pet
attr_reader :name

def initialize(name)
  @name = name.to_s
end

def to_s
  "My name is #{@name.upcase}."
end
end

# name = 'Fluffy'         # local variable `name` initialized to String 'Fluffy'
# fluffy = Pet.new(name)  # lv `fluffy` initialized to a new Pet object with lv `name`
#                         #   passed in as an argument. fluffy.name initialized to 'Fluffy'
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

# Further exploration
# What would happen in this case?

# String#to_s returns the original string object. Integer#to_s returns a new object, a string

name = 42
fluffy = Pet.new(name)
name += 1               # Local variable `name` is now 43 but fluffy.name is "42" (differnt objects)
puts fluffy.name        # 42
puts fluffy             # My name is 42
puts fluffy.name        # 42
puts name               # 43
