# Encrypt class
class Encrypt
  attr_accessor :sentence, :shift_value
  def encrypt
    code = ''
    @sentence.each_char do |char|
      code += if char.to_s =~ /[a-z]/i
                new_val = char.ord + @shift_value
                new_val -= 26 if (new_val > 90 && new_val < 97) || new_val > 122
                new_val.chr
              else
                char
              end
    end
    code
  end
end
