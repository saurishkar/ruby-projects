# class Dynamic
class Dynamic < String
  def initialize(input_string)
    @input = input_string
  end

  def exclude?(str)
    !@input.include?(str)
  end

  def substring(end_idx, start_idx = 0)
    end_idx = end_idx.to_i
    if end_idx >= start_idx
      @input.chars[start_idx..end_idx].join
    else
      @input.chars[start_idx..@input.length - 1].join
    end
  end

  def test(a, b = 2, *c)
    puts a, b, c
  end
end

# menu driven program for accepting methods dynamically from user
class Menu
  def initialize(input_str)
    @dynamic = Dynamic.new(input_str)
    show_public_methods
    @method_name = input_method_name
    @method_arguments = input_method_arguments
  end

  def input_method_name
    flag = false, method_name = ''
    until flag == true
      print 'Enter a method from the list to call: '
      method_name = gets.chomp
      unless @dynamic.public_methods(false).include?(method_name.to_sym)
        puts '', 'Please enter a valid method', @dynamic.public_methods(false)
      end
      flag = true if @dynamic.public_methods(false).include?(method_name.to_sym)
    end
    method_name
  end

  def input_method_arguments
    method_arguments = []
    @dynamic.method(@method_name.to_sym).parameters
            .each_with_index do |arg, index|
              print message_by_arg_type(arg)
              input_var = input_arguments_by_type(arg)
              method_arguments[index] = input_var
            end
    method_arguments
  end

  def input_arguments_by_type(arg)
    arg_type = arg[0].to_s
    value = if arg_type == 'req'
              input_required_argument(arg)
            elsif arg_type == 'rest'
              input_rest_arguments
            else
              input_optional_argument
            end
    value
  end

  def input_required_argument(arg)
    value = gets.chomp
    while value.nil? || value.empty?
      print message_by_arg_type(arg)
      value = gets.chomp
    end
    value
  end

  def input_optional_argument
    gets.chomp
  end

  def input_rest_arguments
    gets.chomp.split(/,+/)
  end

  def message_by_arg_type(arg)
    arg_type = arg[0].to_s
    msg = "Enter #{arg[1].to_s} "
    msg += '(Comma separated arguments): ' if arg_type == 'rest'
    msg += '(Required): ' if arg_type == 'req'
    msg += '(Optional): ' if arg_type == 'opt'
    msg
  end

  def run_dynamic_method
    @dynamic.send(@method_name, *@method_arguments)
  end

  def show_public_methods
    puts 'The following methods can be used on this string'
    puts @dynamic.public_methods(false)
  end
end

print 'Enter a string: '
menu = Menu.new(gets.chomp)

puts menu.run_dynamic_method
