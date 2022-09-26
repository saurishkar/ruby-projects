# class Provider
class Storage
  def generator_code
    initial_alphabet = 'H'
    count = 3
    prefix = 'hot-'

    alphabet = initial_alphabet
    value = 0
    increment_alphabet = true
    (0..Float::INFINITY).lazy.collect do
      code = Array.new(count) { alphabet }.join
      value += 1 unless increment_alphabet
      alphabet = if increment_alphabet && alphabet != 'Z'
                   alphabet.succ
                 elsif alphabet == 'Z'
                   increment_alphabet = false
                   initial_alphabet
                 else
                   initial_alphabet
                 end
      "#{prefix}#{code}#{value.to_s if value > 0}"
    end.each
  end
end
