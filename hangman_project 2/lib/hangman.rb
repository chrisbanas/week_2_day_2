class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

# class methods

  def self.random_word #since this is a class method we have to call it using self
    DICTIONARY.sample
  end

# initialize

  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

# getter methods (these are the methods that users can see. you still have to call it using @ in the other methods)

    def guess_word
      @guess_word
    end

    def attempted_chars
      @attempted_chars
    end

    def remaining_incorrect_guesses
      @remaining_incorrect_guesses
    end

# other methods

    def already_attempted?(char)
      @attempted_chars.include?(char) ? true : false
    end

    def get_matching_indices(char)
      char_indices = []
      @secret_word.each_char.with_index { |letter, i| char_indices << i if letter == char }
      char_indices
    end

    def fill_indices(char, indices)  #the video differed here
      self.get_matching_indices(char).each { |i| guess_word[i] = char }
    end

# Part 2 ( I initially was not calling self on the methods calls, but it didn't seem to matter)

    def try_guess(char)
      if self.already_attempted?(char)
        puts 'that has already been attempted'
        return false
      end

        @attempted_chars << char
        self.fill_indices(char, self.get_matching_indices(char))
        @remaining_incorrect_guesses -= 1 if self.get_matching_indices(char) == []
        true
        # I had initially done this below part but it would never accept the first char of the string. The logic above fills it no matter what even if blank. Then it goes to check if it was blank strike 1.
      # else
      #       # if self.get_matching_indices(char) == []
      #       #   @remaining_incorrect_guesses -= 1
      #       #   true
      #       # elsif self.get_matching_indices(char).sum > 0
      #       #   self.fill_indices(char, self.get_matching_indices(char))
      #       #   true
      #         end
      # end
    end

    def ask_user_for_guess
      puts "Enter a char:"
      char = gets.chomp
      self.try_guess(char)
    end

    def win?
     if @secret_word == @guess_word.join("")
      puts "WIN"
      true
     else
      false
     end
    end

    def lose?
      if @remaining_incorrect_guesses == 0
        puts "LOSE"
        true
      else
        false
      end
    end

    def game_over?
      if self.win? == true && self.lose? == false
        puts @secret_word
        true
      elsif self.win? == false && self.lose? == true
        puts @secret_word
        true
      else
        false
      end
    end

end
