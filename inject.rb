# Dividing array items into groups using inject
class Array
  def inject_arr
    inject(Hash.new { |h, k| h[k] = [] }) do |res, item|
      res = if item[0].even?
              res.merge('even' => res['even'].push(item[1]))
            else
              res.merge('odd' => res['odd'].push(item[1]))
            end
      res
    end
  end

  def group_values_by_length(str_input)
    arr = str_input.scan(/\w+/)
    res = Hash.new { |h, k| h[k] = [] }
    arr.each { |str| res = res.merge(str.length => res[str.length].push(str)) }
    res.to_a
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  puts [].group_values_by_length(ARGV[0]).inject_arr
end
