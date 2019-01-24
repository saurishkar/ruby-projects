# CLASS TO FIND PRIME NUMBERS UPTO N using STEP function
class Numeric
  def initialize(limit)
    @limit = limit.to_i
  end

  def generate_prime_series
    arr = []
    2.step(by: 1, to: @limit) do |num|
      count = 0
      1.step(by: 1, to: num / 2) do |divisor|
        count += 1 if (num % divisor).zero?
      end
      arr.push(num) if count == 1
    end
    arr
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  pr_obj = Numeric.new(ARGV[0])
  print pr_obj.generate_prime_series
end
