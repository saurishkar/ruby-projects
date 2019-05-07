# Interactive class
class Interactive
  REGEX_QUIT = /q/
  def initialize
    @code = ''
    @input = ''
    @context = context
  end

  def context
    binding
  end

  def initiate
    until @input =~ REGEX_QUIT
      print '>> '
      @input = gets.chomp
      if @input.empty?
        puts execute
        @code = ''
      else
        @code += @input + ';'
      end
    end
  end

  def execute
    eval @code, @context
  end
end

ob = Interactive.new
ob.initiate
