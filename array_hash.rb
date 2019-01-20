# Array class having gen_array_hash as method
class Array
  attr_accessor :str

  def group_values_by_length
    str_arr = @str.scan(/\w+/)
    res = Hash.new { |h, k| h[k] = [] }
    str_arr.each do |str|
      res[str.length] = res[str.length].push(str)
    end
    res.sort.to_h
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  str_obj = Array.new
  str_obj.str = ARGV[0]
  puts str_obj.group_values_by_length
end
