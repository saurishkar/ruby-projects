class InverseCase
  def initialize(str)
    @str = str
  end

  def to_s
    @str.swapcase
  end
end

puts "Enter an input"
str = gets.chomp
if str.empty?
  puts "Enter a valid input"
else
  strObj = InverseCase.new(str)
  puts strObj.to_s
end
