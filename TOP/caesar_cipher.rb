def caesar_cipher(str, num)
  res = ''
  num = num % 26
  str.split("").each do |ch|
    code = ch.ord
    updated_code = code
    if code >= 65 && code <= 90
      updated_code += num
      updated_code -= 26 if updated_code > 90
    elsif code >= 97 && code <= 122
      updated_code += num
      updated_code -= 26 if updated_code > 122
    end
    res += updated_code.chr
  end
  res
end
