# CLASS TO REVERSE WORD ARRANGEMENT IN A SENTENCE
class String
  REGEX_SPACE_OR_QUOTES = /\s+|"/

  def reverse_word_arrangement
    split(REGEX_SPACE_OR_QUOTES).reverse.join(' ')
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  str = ARGV[0]
  p str.reverse_word_arrangement
end
