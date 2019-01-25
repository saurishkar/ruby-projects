# HIGHLIGHT SEARCH CLASS
class String
  def count_occurrence(search_str)
    scan(/#{search_str}/i).length
  end

  def highlight_occurrence(search_str)
    gsub(/#{search_str}/i) { |match| match.replace("(#{match})") }
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  search_input = ARGV[0]
  print search_input.highlight_occurrence(ARGV[1]), "\n"
  print 'Total occurrences found: '
  print search_input.count_occurrence(ARGV[1]), "\n"
end
