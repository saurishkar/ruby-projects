public def generate_fibonacci(max_limit)
  prev = 0
  nex = 1
  yield nex
  loop do
    sum = prev + nex
    yield sum
    prev = nex
    nex = sum
    break if prev + nex > max_limit
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  generate_fibonacci(ARGV[0].to_i) { |num| print(num, ' ') }
end
