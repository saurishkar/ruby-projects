# Array class having gen_array_hash as method
class Array
  def group_values_by_length
    res = Hash.new { |hash, key| hash[key] = [] }
    each do |str|
      res[str.length].push(str)
    end
    res.sort.to_h
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  REGEX_PATTERN_WORD = /\w+/
  arr = ARGV[0].scan(REGEX_PATTERN_WORD)
  puts arr.group_values_by_length
end
