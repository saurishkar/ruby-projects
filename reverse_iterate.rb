# Array class
class Array
  def reverse_iterate
    pos = length - 1
    new_array = []
    until pos < 0
      new_array.push(self[pos])
      pos -= 1
    end
    new_array
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  input_arr = ARGV[0].scan(/[0-9a-zA-Z.-]+/)
  input_arr.reverse_iterate.each { |elem| print elem, ' ' }
end
