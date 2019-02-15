# class Name
class Name
  attr_reader :firstname, :lastname

  def initialize(firstname, lastname)
    error_message = if blank?(firstname)
                      'Firstname cannot be blank'
                    elsif !capital_case?(firstname)
                      'Firstname must start with uppercase letter'
                    elsif blank?(lastname)
                      'Lastname cannot be blank'
                    end
    raise InvalidNameError, error_message unless error_message.nil?

    @firstname = firstname
    @lastname = lastname
  end

  def blank?(param)
    param.nil? || param.empty?
  end

  def capital_case?(param = '')
    param[0] == param[0].upcase
  end

  def to_s
    "Your name is #{@firstname} #{@lastname}"
  end
end

# Name Exception class
class InvalidNameError < StandardError
  attr_reader :message
end

if ARGV.empty?
  puts 'Please provide an input'
else
  begin
    name_obj = Name.new(ARGV[0], ARGV[1])
  rescue InvalidNameError => error
    puts error
  else
    puts name_obj
  end
end
