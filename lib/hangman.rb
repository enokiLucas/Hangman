file = File.read("../english_words.txt")
word = File.readlines("../english_words.txt")

#puts word.is_a?(Array) => true

File.open("words_5-12.txt", "w") do |file|
	word.each do |word|
		if 5 <= word.length && word.length <= 12 
			file.puts word
		end
	end
end