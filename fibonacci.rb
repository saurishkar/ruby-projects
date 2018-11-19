public def generate_fibonacci(count)
  i = 1
  a = 0
  b = 1
  c = 0
  while i <= count
    c = a + b
    yield c
    a = b
    b = c
    i = i + 1
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