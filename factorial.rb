# CLASS THAT USES RANGE TO FIND THE FACTORIAL OF A NUMBER
class Numeric
  def initialize(num)
    @num = num
  end

  def factorial
    (1..@num.to_i).reduce(1, :*)
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  num = Numeric.new(ARGV[0])
  puts num.factorial
end
