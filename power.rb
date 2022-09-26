# ADDING POWER METHOD TO ARRAY CLASS
class Array
  def power(limit)
    map { |num| num**limit }
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  arr = ARGV[0].scan(/\d+/).map(&:to_i)
  print arr.power(ARGV[1].to_i)
end
