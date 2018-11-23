def find_string_occurrence(str)
  res = {}
  str = str.gsub(/\W|[0-9]/, '')
  str.each_char { |ch| res[ch] = ch =~ /[[:alpha:]]$/ && str.scan(/#{ch}/).length }
  res
end

str_input = ARGV

if str_input.empty?
  puts 'Please provide an input'
else
  puts find_string_occurrence(str_input[0])
end
