# Dividing array items into groups using inject
class Array
  def inject_arr
    inject({}) do |hsh, item|
      if item.length.odd?
        hsh['odd'] = (hsh['odd'] || []).push(item)
      else
        hsh['even'] = (hsh['even'] || []).push(item)
      end
      hsh
    end
  end

  def gen_array_hash
    res = {}
    map(&:to_s)
    sort_by!(&:length)
    each { |str| res[str.length] = (res[str.length] || []).push(str) }
    res
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  puts ARGV[0].scan(/\w+/).gen_array_hash.inject_arr
end
