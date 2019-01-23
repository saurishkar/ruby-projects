# OCCURRENCE CLASS
class Occurrence
  attr_accessor :str

  REGEX_PATTERNS = {
    alpha: /[[:alpha:]]/
  }.freeze

  def find_string_occurrence
    res = Hash.new(0)
    @str.each_char do |ch|
      res[ch] += 1 unless ch !~ REGEX_PATTERNS[:alpha]
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
