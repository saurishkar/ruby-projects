# Time Class
class Time
  def initialize(str)
    if str =~ /[\d\d:\d\d:\d\d]/i
      @time_var = str
      true
    else
      false
    end
  end

  def add(time_obj)
    @time_var + time_obj
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  time_obj1 = Time.new(ARGV[0])
  time_obj2 = Time.new(ARGV[1])
  if time_obj1 && time_obj2
    puts time_obj1.add(time_obj2)
  else
    puts 'Format invalid'
  end
end
