public def generate_fibonacci(count)
  prev, nex, sum = 0, 1, 0
  while count > 0
    sum = prev + nex
    yield sum
    prev, nex = nex, sum
    count -=1
  end 
end

puts "Enter the count of numbers to display"

count = gets.chomp.to_i

if count > 0
  generate_fibonacci(count) { |num| printf("%i ", num) }
  puts ""
else
  puts "Enter a valid Input"
end