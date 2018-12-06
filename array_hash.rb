# Array class having gen_array_hash as method
class Array
  def gen_array_hash
    res = {}
    each { |str| res[str.length] = (res[str.length] || []).push(str) }
    res.sort.to_h
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  puts ARGV[0].scan(/\w+/).gen_array_hash
end
