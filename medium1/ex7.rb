class GuessingGame
  def initialize(guess_range_start, guess_range_end)
    @guess_range_start = guess_range_start
    @guess_range_end = guess_range_end
    @guess_range = (@guess_range_start..@guess_range_end)
    @total_guesses = Math.log2(guess_range.size).to_i + 1
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

  attr_accessor :guesses_remaining, :winning_number, :guess, :guess_range_start,
                :guess_range_end
  attr_reader :guess_range, :total_guesses

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
    self.winning_number = (guess_range).to_a.sample
    self.guesses_remaining = total_guesses
  end

  def num_guesses_remaining
    "You have #{guesses_remaining} guesses remaining."
  end

  def ask_for_guess
    loop do
      print guess_prompt
      self.guess = gets.chomp.to_i
      break if (guess_range) === guess
      print "#{invalid_guess} #{guess_prompt}"
    end
    self.guesses_remaining -= 1
  end

  def guess_prompt
    "Enter a number between #{guess_range_start} and #{guess_range_end}: "
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


GuessingGame.new(501, 15000).play

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