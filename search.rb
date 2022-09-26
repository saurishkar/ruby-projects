# HIGHLIGHT SEARCH CLASS
class String
  def count_occurrence(search_str)
    reg_exp = Regexp.new(search_str, true)
    scan(reg_exp).length
  end

  def highlight_occurrence(search_str)
    reg_exp = Regexp.new(search_str, true)
    gsub(reg_exp) { "(#{Regexp.last_match[0]})" }
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
