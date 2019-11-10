class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = self.random_word
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
    @secret_word.each_with_index { |ele, idx| indices << idx if char == ele }
    indices
  end

  def fill_indices(char, array)
    @secret_word.each_with_index.map! { |ele, idx| }
  end
end

__END__

    #fill_indices
      should accept a char and an array of indices (FAILED - 17)
      should set the given indices of @guess_word to the given char (FAILED - 18)

Hangman
  PART 2
    #try_guess
      should accept a char as an arg (FAILED - 19)
      should call Hangman#already_attempted? (FAILED - 20)
      should call Hangman#get_matching_indices with the char (FAILED - 21)
      should call Hangman#fill_indices with the char and it's matching indices (FAILED - 22)
      if the char was already attempted
        should print 'that has already been attempted' (FAILED - 23)
        should return false to indicate the guess was previously attempted (FAILED - 24)
      if the char was not already attempted
        should add the char to @attempted_chars (FAILED - 25)
        should return true to indicate the guess was not previously attempted (FAILED - 26)
      if the char has no match indices in @secret_word
        should decrement @remaining_incorrect_guesses (FAILED - 27)
    #ask_user_for_guess
      should print 'Enter a char:' (FAILED - 28)
      should call gets.chomp to get input from the user (FAILED - 29)
      should call Hangman#try_guess with the user's char (FAILED - 30)
      should return the return value of Hangman#try_guess (FAILED - 31)
    win?
      when @guess_word matches @secret_word
        should print 'WIN' (FAILED - 32)
        should return true (FAILED - 33)
      when @guess_word does not match @secret_word
        should return false (FAILED - 34)
    lose?
      when @remaining_incorrect_guesses is 0
        should print 'LOSE' (FAILED - 35)
        should return true (FAILED - 36)
      when @remaining_incorrect_guesses is not 0
        should return false (FAILED - 37)
    game_over?
      should call Hangman#win? (FAILED - 38)
      should call Hangman#lose? (FAILED - 39)
      when the game is won or lost
        should print @secret_word (FAILED - 40)
        should return true (FAILED - 41)
      when the game is not over
        should return false (FAILED - 42)