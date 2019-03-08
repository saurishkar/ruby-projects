# Array class
class Array
  def reverse_iterate
    (length - 1).downto(0).collect { |pos| self[pos] }
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  input_arr = ARGV[0].scan(/[0-9a-zA-Z.-]+/)
  input_arr.reverse_iterate.each { |elem| print elem, ' ' }
end
