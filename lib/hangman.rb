file = File.read("../english_words.txt")
word = File.readlines("../english_words.txt")


#puts word.is_a?(Array) => true

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

lives = 5
def display_lives(lives)
	puts "You have #{lives}"
end

def select_word
	line = rand(1..8450)
	secret_word = File.readlines("words_1.txt")
	return secret_word[line]
end

select_word
secret_word = select_word
secret_letter = Array.new(secret_word.length - 1, "_")

def display_letters(secret_letter)
	secret_letter.each do |letter|
		print "#{letter} "
	end
end

def choose_letter(secret_word, secret_letter)
	print "Choose a letter: "
	choosen_letter = gets.chomp
	secret_word.chars.each_with_index do |letter, i|
		if letter == choosen_letter
			secret_letter[i] = choosen_letter
		end
	end
end

puts secret_word
display_letters(secret_letter)
choose_letter(secret_word, secret_letter)
display_letters(secret_letter)
