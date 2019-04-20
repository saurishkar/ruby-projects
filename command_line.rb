# Dynamic Class
class DynamicClass
  def initialize(class_name)
    Object.const_set(class_name, Class.new)
    @class = eval class_name
  end

  def def_method(method_name, method_body)
    @method_name = method_name
    @class.define_method(method_name.to_sym) { eval method_body }
    print "Hello, Your class #{@class} with method #{method_name} is ready."
  end

  def call_method
    print " Calling: #{@class}.new.#{@method_name}: ", "\n"
    @class.new.public_send(@method_name)
  end
end

print 'Please enter a class name: '
class_name = gets.chomp
dynamic_class = DynamicClass.new(class_name)
print 'Please enter the method name you wish to define: '
method_name = gets.chomp
print "Please enter the method's code: "
code = gets.chomp
dynamic_class.def_method(method_name, code)
puts "\n", '----RESULT----'
puts dynamic_class.call_method
