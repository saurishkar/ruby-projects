# CLASS TO REVERSE WORD ARRANGEMENT IN A SENTENCE
class ReverseWord
  def initialize(str)
    @str = str
  end

  def reverse_word_arrangement
    @str.split(/\s+|"/).reverse.join(' ')
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  str_obj = ReverseWord.new(ARGV[0])
  p str_obj.reverse_word_arrangement
end
