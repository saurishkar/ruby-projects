class Palindrome < String
  def initialize(str)
    @str = str 
  end

  def palindrome?
    (@str <=> @str.reverse) == 0 ? true : false
  end
end

puts "Enter an input"
str = gets.chomp

if str.empty?
  puts "Enter a valid input"
else
  strObj = Palindrome.new(str)
  puts strObj.palindrome? ? "Input is a palindrome" : "Input is not a palindrome"
end


