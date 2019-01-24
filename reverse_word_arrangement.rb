# CLASS TO REVERSE WORD ARRANGEMENT IN A SENTENCE
class String
  REGEX_PATTERNS = {
    white_space_or_quotes: /\s+|"/
  }.freeze

  def initialize(str)
    @str = str
  end

  def reverse_word_arrangement
    @str.split(REGEX_PATTERNS[:white_space_or_quotes]).reverse.join(' ')
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  str_obj = String.new(ARGV[0])
  p str_obj.reverse_word_arrangement
end
