# INVERSE THE CASE OF EVERY CHARACTER
class String
  def to_s
    swapcase
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  puts ARGV[0].to_s
end
