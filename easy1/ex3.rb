# Complete this program so that it produces the expected output:

# Expected output:
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

class Book
  attr_reader :title, :author

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)


# Further exploration
# What are the differences between attr_reader, attr_writer, and attr_accessor?
# All three accessor methods create getter and/or setter methods AND instance variables.
# attr_accessor creates both getter and setter methods, attr_reader creates only
# getter (no setter), and attr_writer creates setter only (no getter).

# Why did we use attr_reader instead of one of the other two?
# We used attr_reader because this code example only called for retrieving
# the instance variables @title and @book, so we don't explicitly need setters.

# Would it be okay to use one of the others? Why or why not?
# Using attr_accessor here would be fine because there is no explicit reason or 
# instruction to avoid creating a setter method. However, we cannot use attr_writer
# alone because we need a getter method and that will only offer a setter method.

# Instead of attr_reader, suppose you added the following methods to the class:
def title
  @title
end

def author
  @author
end
# Would this change the behavior of the class in any way? If so, how? If not, why not?
# This won't change the behavior in the class in any way, because this is exactly
# what we are creating with attr_reader :title, :author

# Can you think of any advantages to this code?
# This explicit/manual definition of the getter methods would allow us to add
# custom functionality to the getter methods (not relevant here but could be)