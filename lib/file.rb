require "yaml"

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

  # Define two methods, one to write and one to read both the word and u_word

  def self.write_save(word, u_word, round)
    File.write(File.expand_path("~/Odin/Ruby/ruby-hangman/lib/save.yaml"), YAML.dump({
                                                                                       word: word,
                                                                                       u_word: u_word,
                                                                                       round: round
                                                                                     }))
  end

  def self.read_save
    YAML.load_file(File.expand_path("~/Odin/Ruby/ruby-hangman/lib/save.yaml"))
  end
end
