# Class Interest
class Interest
  INTEREST_RATE = 0.1

  def initialize(principal, time, &block)
    @principal = principal.to_f
    @time = time.to_f
    @block = block
  end

  def calc_interest
    @block.call(@principal, INTEREST_RATE, @time)
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  principal = ARGV[0]
  time = ARGV[1]
  simple_interest_obj = Interest.new(principal, time) do |p, r, t|
    (p * r * t)
  end
  compound_interest_obj = Interest.new(principal, time) do |p, r, t|
    (p * ((1 + r)**t - 1))
  end
  simple_interest = simple_interest_obj.calc_interest.round(2)
  compound_interest = compound_interest_obj.calc_interest.round(2)

  print 'Interest difference= '
  printf('%.2f', compound_interest - simple_interest)
end
