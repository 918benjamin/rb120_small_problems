class GuessingGame
  TOTAL_GUESSES = 7
  GUESS_RANGE_START = 1
  GUESS_RANGE_END = 100

  def initialize
    reset
    @guess = nil
  end

  def play
    loop do
      puts num_guesses_remaining
      ask_for_guess
      break if valid_guess? || out_of_guesses?
      puts clue
      puts ""
    end

    display_result
  end

  private

  attr_accessor :guesses_remaining, :winning_number, :guess

  def display_result
    if valid_guess?
      puts "That's the number!"
      puts ""
      puts "You won!"
    else
      puts "You have no more guesses. You lost! The number was #{winning_number}"
    end
  end

  def clue
    case guess <=> winning_number
    when 1 then "Your guess is too  high."
    when -1 then "Your guess is too low."
    end
  end

  def reset
    self.winning_number = (GUESS_RANGE_START..GUESS_RANGE_END).to_a.sample
    self.guesses_remaining = TOTAL_GUESSES
  end

  def num_guesses_remaining
    "You have #{guesses_remaining} guesses remaining."
  end

  def ask_for_guess
    loop do
      print guess_prompt
      self.guess = gets.chomp.to_i
      break if (GUESS_RANGE_START..GUESS_RANGE_END) === guess
      print "#{invalid_guess} #{guess_prompt}"
    end
    self.guesses_remaining -= 1
  end

  def guess_prompt
    "Enter a number between #{GUESS_RANGE_START} and #{GUESS_RANGE_END}: "
  end

  def invalid_guess
    "Invalid guess."
  end

  def valid_guess?
    guess == winning_number
  end

  def out_of_guesses?
    guesses_remaining <= 0
  end
end


game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!