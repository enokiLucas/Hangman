file = File.read("../english_words.txt")
word = File.readlines("../english_words.txt")

=begin
puts word.is_a?(Array) => true

File.open("words_5-12.txt", "w") do |file|
	word.each do |word|
		if 5 <= word.length && word.length <= 12 
			file.puts word
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

