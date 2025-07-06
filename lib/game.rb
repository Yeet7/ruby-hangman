require_relative "file"

# defines game logic
class Game
  # define method to create basic string of underscores for each letter in word
  # each time a letter is guessed correctly, replace the underscore with that letter.

  def self.play_game(string, u_word, char)
    string.chars.each_with_index do |c, index|
      u_word[index] = char if c == char
    end
  end

  def self.word_to_uscore(string)
    string.gsub(/./, "_")
  end

  def self.winner?(u_word)
    true if u_word.chars.index("_").nil?
  end
end
