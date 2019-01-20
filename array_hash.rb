# Array class having gen_array_hash as method
class Array
  def group_values_by_length(str_input)
    str_arr = str_input.scan(/\w+/)
    res = Hash.new { |h, k| h[k] = [] }
    str_arr.each do |str|
      res = res.merge(str.length => res[str.length].push(str))
    end
    res.sort.to_h
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  puts [].group_values_by_length(ARGV[0])
end
