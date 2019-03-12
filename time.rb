# Time class
class Time
  attr_accessor :time
  YEAR = 1970
  MONTH = 1
  DAY = 1

  def initialize(time_str)
    raise '"Invalid 24-hour time value"' unless time_valid?(time_str)
    hour, min, sec = time_str.split(':').map(&:to_i)
    @time = Time.mktime(YEAR, MONTH, DAY, hour, min, sec)
  end

  def add(time_val_obj)
    default_time = Time.mktime(YEAR, MONTH, DAY)
    Time.at(@time.to_i + time_val_obj.time.to_i - 2 * default_time.to_i)
  end

  def time_valid?(time_str)
    regex = /^([01]?\d|2[0-3]):([0-5]?\d):([0-5]?\d)$/
    is_valid = time_str =~ regex
    !is_valid.nil?
  end

  def to_s
    statement = ''
    statement += "#{day - 1} day#{day > 2 ? 's' : ''} & " if day > 1
    statement += strftime('%H:%M:%S').to_s
    '"' + statement + '"'
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  begin
    time_obj1 = Time.new(ARGV[0])
    time_obj2 = Time.new(ARGV[1])
  rescue StandardError => error
    puts error
  else
    new_time = time_obj1.add(time_obj2)
    puts new_time
  end
end
