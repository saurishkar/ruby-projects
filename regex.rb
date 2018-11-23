def replace_vowel(str)
  str.gsub(/[aeiou]/, '*')
end

if ARGV.empty?
  puts 'Please provide an input'
else
  puts replace_vowel(ARGV[0])
end
