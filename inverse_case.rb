# INVERSE THE CASE OF EVERY CHARACTER
class InverseCase
  def initialize(str)
    @str = str
  end

  def to_s
    @str.swapcase
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  str_obj = InverseCase.new(ARGV[0])
  puts str_obj.to_s
end
