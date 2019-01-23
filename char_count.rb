# CHARCOUNT CLASS TO COUNT LOWER CASE, UPPER CASE, DIGITS AND SPECIAL CHARACTERS
class Character
  def initialize(str)
    @str = str
    @count_hash = Hash.new(0)
  end

  def check_character_count
    @str.each_char { |ch| update_count(ch) }
  end

  def update_count(ch)
    case ch
    when 'a'..'z'
      @count_hash['lower'] += 1
    when 'A'..'Z'
      @count_hash['upper'] += 1
    when '0'..'9'
      @count_hash['digit'] += 1
    else
      @count_hash['special'] += 1
    end
  end

  def display_count
    print 'Lowercase characters = ', @count_hash['lower'], "\n"
    print 'Uppercase characters = ', @count_hash['upper'], "\n"
    print 'Numeric characters = ', @count_hash['digit'], "\n"
    print 'Special characters = ', @count_hash['special'], "\n"
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  obj = Character.new(ARGV[0])
  obj.check_character_count
  obj.display_count
end
