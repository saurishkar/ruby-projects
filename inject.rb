# Dividing array items into groups using inject
class Array
  REGEX_PATTERNS = {
    word: /\w+/
  }.freeze

  def inject_arr
    inject(Hash.new { |hash, key| hash[key] = [] }) do |res, item|
      res = if item[0].even?
              res.merge('even' => res['even'].push(item[1]))
            else
              res.merge('odd' => res['odd'].push(item[1]))
            end
      res
    end
  end

  def group_values_by_length(str_input)
    arr = str_input.scan(REGEX_PATTERNS[:word])
    res = Hash.new { |hash, key| hash[key] = [] }
    arr.each { |str| res = res.merge(str.length => res[str.length].push(str)) }
    res.to_a
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  puts [].group_values_by_length(ARGV[0]).inject_arr
end
