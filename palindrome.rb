# TO CHECK WHETHER A STRING IS PALINDROME
class Palindrome
  def initialize(str)
    @str = str
  end

  def palindrome?
    (@str <=> @str.reverse).zero?
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  str_obj = Palindrome.new(ARGV[0])
  puts "Input string is #{str_obj.palindrome? ? '' : 'not '}a palindrome"
end
