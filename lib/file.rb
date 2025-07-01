# Open/Read/Write Files
class Files
  def self.get_word(file)
    # generate a random numbet between 0 and 9894 (inclusive, ..)
    # Read that line, then determine if word_is_long(word) == true
    # if it is true, then return the word. If not, generate a new random num and try that word.
    goal_line = generate_line
    word_is_long = false
    word = ""
    until word_is_long
      File.readlines(file).each_with_index do |line, index|
        if index == goal_line
          word = line.downcase.chomp
          word_is_long = word_is_long?(line)
        end
        goal_line = generate_line if word_is_long == false
      end
    end
    word
  end

  def self.word_is_long?(line)
    line.downcase.chomp

    line.length >= 6
  end

  def self.generate_line
    rand(9894)
  end
end
