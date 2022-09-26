# CLASS THAT USES RANGE TO FIND THE FACTORIAL OF A NUMBER
class Integer
  def factorial
    (1..self).reduce(1, :*)
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  num = ARGV[0].to_i
  puts num.factorial
end
