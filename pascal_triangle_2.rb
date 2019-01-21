# Class Pascal Triangle
class PascalTriangle
  def initialize(num_of_rows)
    @num_of_rows = num_of_rows.to_i
  end

  def generate
    (0..@num_of_rows - 1).each do |row_num|
      generate_row(row_num) { |val| print val, ' ' }
    end
  end

  def generate_row(row)
    val = 1
    yield(val)
    (0..row - 1).each do |col|
      val = val * (row - col) / (col + 1)
      yield(val)
    end
    print "\n"
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  pascal_obj = PascalTriangle.new(ARGV[0])
  pascal_obj.generate
end
