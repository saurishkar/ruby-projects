# CLASS TO FIND PRIME NUMBERS UPTO N using STEP function
class Prime
  def initialize(limit)
    @limit = limit
  end

  def generate_prime_numbers
    arr = []
    2.step(by: 1, to: @limit) do |num|
      count = 0
      1.step(by: 1, to: num / 2) do |divisor|
        count += 1 if (num % divisor).zero?
      end
      arr.push(num) if count == 1
    end
    print arr
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  pr_obj = Prime.new(ARGV[0].to_i)
  pr_obj.generate_prime_numbers
end
