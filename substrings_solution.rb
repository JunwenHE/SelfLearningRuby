=begin
  Author: Junwen HE
  Date: 2/FEB/2019
  This is the solution of substrings by using array and string manipulation.
  Then generate new array with words and count the matched words from dictionary.
  Finally, storing at hash with counted words and show the result by ascending order.
=end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(message, dictionary)
  words = String.new
  words_list = Array.new
  hash_list = Hash.new(0)
  message.each_char do |element|
     if element.downcase.match(/[a-z]/)
      words << element.downcase
     else
      words << " "
     end
  end
  words_list = words.split(" ")
  words_list.each do |word|
    dictionary.each do |dictionary_word|
      hash_list[dictionary_word] += 1 if word.include?(dictionary_word)
    end
  end
  puts hash_list.sort.to_h

end

substrings("Howdy partner, sit down! How's it going?", dictionary)