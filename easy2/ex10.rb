=begin
Now that we have a Walkable module, we are given a new challenge. Apparently
some of our users are nobility, and the regular way of walking simply isn't good
enough. Nobility need to strut.

We need a new class Noble that shows the title and name when walk is called:

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"

We must have access to both name and title because they are needed for other
purposes that we aren't showing here.

byron.name
=> "Byron"
byron.title
=> "Lord"

My solution below redefines the walk method within the Noble class as this seemed
the simplest option to me.

LS solution instead redefines the to_s method in every class that uses the Walkable
module

=end

module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Noble
  attr_reader :name, :title
  include Walkable

  def initialize(name, title)
    @name = name
    @title = title
  end

  def walk
    "#{title} #{name} #{gait} forward"
  end

  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"

p byron.name
# => "Byron"
p byron.title
# => "Lord"