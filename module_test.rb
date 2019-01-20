# TEST MODULE
CONSTANT = 3
module Test
  CONSTANT = 1
  @faltu = 4
  def Test.display
    puts CONSTANT
  end

  def Test.change_value
    @faltu += 2
  end

  def sin
    2
  end
end

# Inner Module inside Test
module Test::Inner
  def (Test::Inner).display
    puts CONSTANT
  end
end
