# HIGHLIGHT SEARCH CLASS
class Search
  @attr_accessor :search_string

  def highlight_occurrence
    @search_string.scan()
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  search_obj = Search.new
  search_obj.search_string = ARGV[0]
  puts search_obj.highlight_occurrence
end
