# CHARCOUNT CLASS TO COUNT LOWER CASE, UPPER CASE, DIGITS AND SPECIAL CHARACTERS
class CharCount
  def initialize(str)
    @str = str
    @lower = 0
    @upper = 0
    @digit = 0
    @special = 0
  end

  def check_character_count
    @str.each_char do |ch|
      if ('a'..'z').to_a.include? ch
        @lower += 1
      elsif ('A'..'Z').to_a.include? ch
        @upper += 1
      elsif ('0'..'9').to_a.include? ch
        @digit += 1
      else @special += 1
      end
    end
  end

  def display_count
    print 'Lowercase characters = ', @lower, "\n"
    print 'Uppercase characters = ', @upper, "\n"
    print 'Numeric characters = ', @digit, "\n"
    print 'Special characters = ', @special, "\n"
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  obj = CharCount.new(ARGV[0])
  obj.check_character_count
  obj.display_count
end
