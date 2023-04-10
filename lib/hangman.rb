class Hangman
  def initialize
    @lives = 5
    @word = select_word
    @secret_letters = Array.new(@word.length - 1, "_")
  end

  def run
    puts @word
    display_letters
    choose_letter
    display_letters
    display_lives
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
			return true
		elsif @secret_letters.include?("_") == false
			return true
		else
			return false
	end
end

game = Hangman.new
game.run


=begin
File.open("words_1.txt", "w") do |file|
	word.each do |word|
		clean_word = word.gsub(/\W+/, '') # remove any non-word characters
		if clean_word.length.between?(5, 12)
			file.puts clean_word
		end
	end
end
=end

=begin
	def display_stickman_with_legs
		puts "     o      "
		puts "    /|\\     "
		puts "  __/_\\__\     "
		puts "  |     |  "
		puts "  |     |  "
		puts "  |     |  "
	end

	display_stickman_with_legs
=end