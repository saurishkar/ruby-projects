# Time Class
class Time
  REGEX_TIME_FORMAT = /[\d\d:\d\d:\d\d]/i

  def self.add_times(time1, time2)
    if time1 =~ REGEX_TIME_FORMAT && time2 =~ REGEX_TIME_FORMAT
      time_params1 = time1.split(/:/).map(&:to_i)
      time_params2 = time2.split(/:/).map(&:to_i)
      time_obj1 = generate_time_obj(time_params1)
      time_obj2 = generate_time_obj(time_params2)
      new_time = time_obj1 + time_obj2.convert_time_to_seconds
      time_obj1.display_result(new_time)
    else
      puts 'Please provide a valid time format'
    end
  end

  def self.generate_time_obj(time_params)
    Time.mktime(
      Time.now.year,
      nil,
      nil,
      time_params[0],
      time_params[1],
      time_params[2]
    )
  end

  def display_result(new_time)
    day = new_time.day - self.day
    print "#{day} day & " if day == 1
    print "#{day} days & " if day > 1
    print new_time.strftime('%H:%M:%S')
  end

  def convert_time_to_seconds
    secs = 0
    elems = to_a
    (0..2).each { |pos| secs += elems[pos] * (60**pos) }
    secs
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  Time.add_times(ARGV[0], ARGV[1])
end
