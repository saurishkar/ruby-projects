def find_string_occurrence(str)
  i = 0
  res = {}
  while i < str.length
    count = 1
    j = i + 1
    if str[i].match(/^[[:alpha:]]$/)
      while j < str.length
        if str[i] == str[j] && str[j].match(/^[[:alpha:]]$/)
          count = count + 1
        end
        j = j + 1
      end
      res.merge!({str[i] => count})
      str.gsub!(str[i], "_")
    end
    count = 0
    i = i + 1
  end
  puts res
end

puts "Enter a string"

strInput = gets.chomp

if strInput.length == 0
  puts "Please provide an input"
else
  find_string_occurrence(strInput)
end


