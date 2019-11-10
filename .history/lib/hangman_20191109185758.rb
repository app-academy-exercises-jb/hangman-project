require "byebug"

class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) { '_' }
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index { |ele, idx| 
      indices << idx if char == ele 
    }
    indices
  end

  def fill_indices(char, array)
    array.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      p "that has already been attempted"
      false
    else
      unless get_matching_indices(char).empty?
        fill_indices(char, get_matching_indices(char)) 
        @remaining_incorrect_guesses -= 1
        @attempted_chars << char
      end
      true
    end
  end

  def ask_user_for_guess
    p "Enter a char:"
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses > 0
      false
    else
      p "LOSE"
      true
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
    else
      return false
    end
  end
end