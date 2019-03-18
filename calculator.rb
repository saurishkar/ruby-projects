# class Calculator
class Calculator
  def initialize(input_string)
    num1, operator, num2 = input_string.split(/,/)
    @num1 = num1.to_i
    @operator = operator.scan(%r{[+*\/-]})[0].to_sym
    @num2 = num2.to_i
  end

  def calculate
    puts send(@operator)
  end

  private

  def +
    @num1 + @num2
  end

  def -
    @num1 - @num2
  end

  def *
    @num1 * @num2
  end

  def /
    @num1 / @num2
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  calc_obj = Calculator.new(ARGV[0])
  calc_obj.calculate
end
