# Class Interest
class Interest
  INTEREST_RATE = 0.1

  def initialize(principal, time, &block)
    raise 'Invalid principal value' if principal.to_f < 0 || principal.empty?
    raise 'Invalid time value' if time.empty? || time.to_f <= 0
    raise 'Block not provided' if block.nil?
    @principal = principal.to_f
    @time = time.to_f
    @block = block
  end

  def calc_simple_interest
    (@principal * INTEREST_RATE * @time).round(2)
  end

  def calc_compound_interest
    (@principal * ((1 + INTEREST_RATE)**@time - 1)).round(2)
  end

  def calc_interest_difference
    @block.call(calc_compound_interest - calc_simple_interest)
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  principal = ARGV[0]
  time = ARGV[1]
  begin
    interest_obj = Interest.new(principal, time) do |diff|
      printf('Interest difference= %.2f', diff)
    end
  rescue StandardError => err
    puts err
  else
    interest_obj.calc_interest_difference
  end
end
