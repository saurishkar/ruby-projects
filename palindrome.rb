# TO CHECK WHETHER A STRING IS PALINDROME
class String
  def palindrome?
    eql?(reverse)
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  str = ARGV[0]
  puts "Input string is #{str.palindrome? ? '' : 'not '}a palindrome"
end
