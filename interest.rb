# Class Interest
class Interest
  INTEREST_RATE = 0.1
  attr_writer :principal, :time

  def initialize
    raise 'Block not provided' unless block_given?
    yield(self)
  end

  def principal
    "$ #{@principal}"
  end
  
  def calc_interest_difference
    calc_compound_interest - calc_simple_interest
  end

  private

  def calc_simple_interest
    (@principal * INTEREST_RATE * @time).round(2)
  end

  def calc_compound_interest
    (@principal * ((1 + INTEREST_RATE)**@time - 1)).round(2)
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  principal = ARGV[0]
  time = ARGV[1]
  begin
    interest_obj = Interest.new do |obj|
      if principal&.to_f.negative?
        raise 'Invalid principal value'
      end
      raise 'Invalid time value' if time&.to_f.negative?
      obj.principal = principal.to_f
      obj.time = time.to_f
    end
  rescue ArgumentError => err
    puts err
  else
    interest_diff = interest_obj.calc_interest_difference
    printf('Interest difference= %.2f', interest_diff)
  end
end
