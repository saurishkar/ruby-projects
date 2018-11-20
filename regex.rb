def replace_vowel(str)
  str.gsub(/[aeiou]/, "*")
end

puts "Enter a string"

strInput = gets.chomp

if strInput.length == 0
  puts "Please provide an input"
else
  puts replace_vowel(strInput)
end


