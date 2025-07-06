require_relative "lib/file"
require_relative "lib/game"

word = Files.get_word("./src/words.txt")

u_word = Game.word_to_uscore(word)
round = 1

puts "Would you like to load a save?"

get_save = gets.downcase.chomp

if get_save == "yes"
  save = Files.read_save
  word = save[:word]
  u_word = save[:u_word]
  round = save[:round]
end

puts word
puts u_word
puts round

(round..6).each_with_index do |_e, index|
  puts "Round #{index + 1}, please guess a letter or save!"
  input = gets.downcase.chomp
  if input == "save"
    Files.write_save(word, u_word, round)
    puts "You've saved!"
    exit
  elsif input == "solve!"
    puts "Please put your answer! You only get one attempt to solve!"
    guess_answer = gets.downcase.chomp
    if guess_answer == word
      puts "You guessed the word! You win!"
    else
      puts "You didn't guess correctly! You lose!"
    end
    exit
  end
  Game.play_game(word, u_word, input)
  puts u_word
  if Game.winner?(u_word)
    puts "You guessed the word! You win!"
    exit
  end
  round += 1
end

puts "You didn't guess the word, better luck next time!"
