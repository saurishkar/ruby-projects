def get_freq(str, word)
  count = 0
  while str.include?(word)
    count += 1
    str = str.sub(word, '')
  end
  count
end

def substrings(word, dictionary)
  freq = Hash.new(0)
  dictionary.each do |w|
    freq[w] += get_freq(word.downcase, w)
  end
  freq.select { |_k, v| v > 0 }
end
