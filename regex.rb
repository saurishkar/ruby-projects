def replace_vowel(str)
  str.gsub!(/a+|e+|i+|o+|u+/, "*")
  puts str
end

puts "Enter a string"

strInput = gets.chomp

if strInput.length == 0
  puts "Please provide an input"
else
  replace_vowel(strInput)
end


