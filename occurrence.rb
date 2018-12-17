# OCCURRENCE CLASS
class Occurrence
  attr_accessor :str
  def find_string_occurrence
    res = {}
    @str.each_char do |ch|
      res[ch] = @str.scan(/#{ch}/).length unless ch =~ /\W|[0-9]/ || res[ch]
    end
    res
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  str_obj = Occurrence.new
  str_obj.str = ARGV[0]
  puts str_obj.find_string_occurrence
end
