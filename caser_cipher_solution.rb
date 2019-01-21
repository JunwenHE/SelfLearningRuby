=begin 
  Author: Junwen HE
  Date: 21/JAN/2019
  This is a Caesar Cipher program which is implemented by Ruby. 
  User need to enter a sentence and the shift number. 
  In order to transform a string by the shift positions and output the modified message.
=end

# Declare a variable that collects all transformed letter
$output = ""

def caesar_cipher(string_message,shift_value)
  # Identify each letter is capital or not, then start transformation process
  # Other symbols don't need to be transformed.
  string_message.each_char do |letter|
    letter_index = letter.ord
    if letter.match(/[A-Z]/)
      transformation(65,90,letter_index,shift_value)
    elsif letter.match(/[a-z]/)
      transformation(97,122,letter_index,shift_value)
    else
      $output << letter
    end
  end
  puts $output
end

def transformation(min_range,max_range,letter_index,shift_value)
  # Declare a local variable to get the result then retuern to the output variable
  result = String.new
  if letter_index >= min_range && letter_index <= max_range
    new_index = letter_index + shift_value
    if new_index > max_range
      # wrap from z to a by index subtraction
      adjusted_index = new_index - 26
      result << adjusted_index.chr
    else
      result << new_index.chr
    end
  end
  $output << result
end

puts "Please enter sentence"
sentence = gets
puts "Please enter shift numer"
value = gets
caesar_cipher(sentence,value.to_i)