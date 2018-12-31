# CLASS THAT USES RANGE TO FIND THE FACTORIAL OF A NUMBER
class RangeFactorial
  def initialize(num)
    @num = num
  end

  def factorial
    (1..@num).reduce(1, :*)
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  fact_obj = RangeFactorial.new(ARGV[0].to_i)
  puts fact_obj.factorial
end
