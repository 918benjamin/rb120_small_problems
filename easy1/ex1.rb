=begin
Complete this class so that the test cases shown below work as intended.
You are free to add any methods or instance variables you need. However, do
not make the implementation details public.

You may assume that the input will always fit in your terminal window.

Further Exploration
Modify this class so new will optionally let you specify a fixed banner width at
the time the Banner object is created. The message in the banner should be
centered within the banner of that width. Decide for yourself how you want to
handle widths that are either too narrow or too wide.

To do:
  [X] Accept the optional width from #new
  [X] Center the message if it is shorter than the given width
  [X] Width is based on message length if no width given (width=nil)
  [X] Width is based on given fixed with if a fixed width is given (width=truthy)
  [no] If the message is longer than the given width, split the message into words
        and put some words on a row and remainder on following rows
  OR
  [X] If message is longer than the given width, only show the message up to the
      point where it cuts off
=end


class Banner
  def initialize(message, width=nil)
    @message = message
    @banner_width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * (@banner_width ? @banner_width : @message.length)}-+"
  end

  def empty_line
    "| #{' ' * (@banner_width ? @banner_width : @message.length)} |"
  end

  def message_line
    if @banner_width
      if @banner_width <= @message.length
        "| #{chars_that_fit} |"
      else
        
        "| #{extra_space}#{@message}#{extra_space} |"
      end
    else
      "| #{@message} |"
    end
  end

  def chars_that_fit
    puts "Too many characters to fit on this banner:"
    @message.slice(0...@banner_width)
  end

  def extra_space
    ' ' * ((@banner_width - @message.length) / 2)
  end
end

# Test cases
banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

banner = Banner.new('To boldly go where no one has gone before.', 16)
puts banner

banner = Banner.new('To boldly go where no one has gone before.', 50)
puts banner