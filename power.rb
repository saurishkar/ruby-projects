# ADDING POWER METHOD TO ARRAY CLASS
class Array
  def power(limit)
    map do |num|
      product = 1
      limit.times { product *= num }
      product
    end
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  arr = ARGV[0].scan(/\d/).map(&:to_i)
  puts arr.power(ARGV[1]).to_s
end
