require 'json'

class Hangman
  def initialize
    @lives = 5
    @word = select_word
    @secret_letters = Array.new(@word.length - 1, "_")
  end

  def run
    puts @word
    game_loop
  end

  private

  def display_lives
    puts "You have #{@lives} lives left."
  end

  def select_word
    line = rand(1..7557)
    secret_word = File.readlines("words_1.txt")
    return secret_word[line]
  end

  def display_letters
    @secret_letters.each do |letter|
      print "#{letter} "
    end
  end

  def choose_letter
    print "Choose a letter: "
    choosen_letter = gets.chomp
    test = false
    @word.chars.each_with_index do |letter, i|
      if letter == choosen_letter
        @secret_letters[i] = choosen_letter
        test = true
      end
    end
    puts test
    if test == false
      @lives -= 1
    end
  end

  def game_end? #return true if the game end false if not
    if @lives == 0
      @victory = false
      puts 'You lost.'
      return true
    elsif @secret_letters.include?("_") == false
      @victory = true
      puts 'You Won!'
      return true
    else
      return false
    end
  end

  def game_loop
    until game_end? == true
      choose_letter
      display_letters
      display_lives
    end
  end

  def save_game
    data = {
      lives: @lives,
      word: @word,
      secret_letters: @secret_letters
    }
    File.open('game.json', 'w') do |f|
      f.write(data.to_json)
    end
    puts "Game saved to 'game.json'"
  end

  def load_game
    if File.exist?('game.json')
      data = JSON.parse(File.read('game.json'), symbolize_names: true)
      @lives = data[:lives]
      @word = data[:word]
      @secret_letters = data[:secret_letters]
      puts "Game loaded from 'game.json'"
      return true
    else
      puts "No saved game found."
      return false
    end
  end
end
