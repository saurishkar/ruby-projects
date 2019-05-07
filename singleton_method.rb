# Using class method definition

object_with_singleton_method = 'This is a string object'
object_without_singleton_method = 'This is another string object'

def object_with_singleton_method.singleton_meth
  puts 'This is a singleton method'
end

puts object_with_singleton_method.singleton_meth
puts object_without_singleton_method.singleton_meth # throws Exception

# Using Singleton class of string
new_obj_with_singleton_method = 'New String'
new_obj_with_singleton_method.instance_eval do
  class << self
    def another_singleton_meth
      puts 'This is another singleton method'
    end
  end
end
new_obj_with_singleton_method.another_singleton_meth
