def replace_vowel(str)
  str.gsub(/[aeiouAEIOU]/, '*')
end

if ARGV.empty?
  puts 'Please provide an input'
else
  puts replace_vowel(ARGV[0])
end
