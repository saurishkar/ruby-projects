# Class Integer
class Integer
  def factorial
    raise 'Negative number entered' if negative?
    (1..self).reduce(1, :*)
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  begin
    puts ARGV[0].to_i.factorial
  rescue StandardError => err
    puts err
  end
end
