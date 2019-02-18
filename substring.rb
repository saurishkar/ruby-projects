# class String
class String
  def look_up(word_array)
    valid_words_hash = {}
    word_array.map do |sub_string|
      regex = Regexp.new(sub_string, 'i')
      valid_words_hash[sub_string] = scan(regex).length if self =~ regex
    end
    valid_words_hash
  end
end
