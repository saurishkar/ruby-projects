input = ''
code = ''
until input =~ /q/
  print '>> '
  input = gets.chomp
  if input == ''
    eval code
    code = ''
  else
    code += input
    code += ';'
  end
end
