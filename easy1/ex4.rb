# Complete this program so that it produces the expected output:

# Expected output:
# The author of "Snow Crash" is Neil Stephenson.
# book = "Snow Crash", by Neil Stephenson.

class Book
  attr_accessor :title, :author

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Further exploration
# What do you think of this way of creating and initializing Book objects? 
# (The two steps are separate.)
# Would it be better to create and initialize at the same time like in the previous exercise?
# What potential problems, if any, are introduced by separating the steps?

# Creating and initializing at the same time is "faster" but it requires that we know
# the title and author at the time of initialization, which we may not. It also
# requires that we know that a book requires a title and an author to be initialized
# correctly, which we may forget.