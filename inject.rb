# String Class
class String
  REGEX_PATTERN_WORD = /\w+/

  def group_values_by_length
    arr = scan(REGEX_PATTERN_WORD)
    res = Hash.new { |hash, key| hash[key] = [] }
    arr.each { |str| res[str.length].push(str) }
    res.to_a
  end
end

# Array Class
class Array
  def inject_arr
    inject(Hash.new { |hash, key| hash[key] = [] }) do |res, item|
      res[item[0].even? ? 'even' : 'odd'].push(item[1])
      res
    end
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  str = ARGV[0]
  puts str.group_values_by_length.inject_arr
end
