# String Class
class String
  REGEX_PATTERN_WORD = /\w+/

  def group_by_length
    array = scan(REGEX_PATTERN_WORD)
    group_hash = Hash.new { |hash, key| hash[key] = [] }
    array.each { |item| group_hash[item.length].push(item) }
    group_hash.to_a
  end
end

# Array Class
class Array
  def group_by_even_odd
    inject(Hash.new { |hash, key| hash[key] = [] }) do |result, item|
      result[item[0].even? ? 'even' : 'odd'].push(item[1])
      result
    end
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  str = ARGV[0]
  puts str.group_by_length.group_by_even_odd
end
