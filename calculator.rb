# class Calculator
class Calculator
  REGEX_NUM = /\d+/
  def self.calculate(*args)
    operands = []
    operands[0], operator, operands[1] = args.collect do |elem|
      (elem.to_s =~ REGEX_NUM).nil? ? elem[1].to_sym : elem.to_i
    end
    operands.inject(operator)
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  operand1, operator, operand2 = ARGV[0].split(/,\s*/)
  puts Calculator.calculate(operand1, operator, operand2)
end
