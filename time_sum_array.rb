# require 'time'
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

  def add(time_obj_array)
    default_time = Time.mktime(YEAR, MONTH, DAY)
    result = time_obj_array.inject(time) do |a, time_obj|
      Time.at(time_obj.time.to_i + a.to_i - 2 * default_time.to_i)
    end
    result
  end

  def time_valid?(time_str)
    hour, min, sec = time_str.split(':').map(&:to_i)
    is_valid = if hour < 24
                 min < 60 && sec < 60
               elsif hour == 24 && min.zero? && sec.zero?
                 true
               end
    is_valid
  end

  def to_s
    statement = ''
    statement += "#{day - 1} day#{day > 2 ? 's' : ''} & " if day > 1
    statement += strftime('%H:%M:%S').to_s
    '"' + statement + '"'
  end
end

# ARGV = ["12:1:1", "12:59:59", "11:23:07"]

if ARGV.empty?
  puts 'Please provide an input'
else
  begin
    initial, *time_obj_array = ARGV.collect { |str| Time.new(str) }
  rescue StandardError => error
    puts error
  else
    puts initial.add(time_obj_array)
  end
end
