# HIGHLIGHT SEARCH CLASS
class String
  attr_accessor :str

  def highlight_occurrence
    @search_string.scan()
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  search_obj = String.new
  search_obj.str = ARGV[0]
  puts search_obj.highlight_occurrence
end
