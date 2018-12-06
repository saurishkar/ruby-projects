# Dividing array items into groups using inject
class Array
  def inject_arr
    inject({}) do |hash, item|
      if item[0].even?
        hash['even'] = (hash['even'] || []).push(item[1])
      else
        hash['odd'] = (hash['odd'] || []).push(item[1])
      end
      hash
    end
  end

  def gen_array_hash
    res = {}
    map(&:to_s)
    each { |str| res[str.length] = (res[str.length] || []).push(str) }
    res.to_a
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  puts ARGV[0].scan(/\w+/).gen_array_hash.inject_arr
end
