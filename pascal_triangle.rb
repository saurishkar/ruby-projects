# Class to generate Pascal triangle
class PascalTriangle
  def generate(num_of_rows)
    return display_row([]) if num_of_rows.zero?

    prev_array = [1]
    i = 2
    display_row([1])
    while i <= num_of_rows
      prev_array = generate_row(i, prev_array) do |new_array|
        display_row(new_array)
        prev_array = new_array
      end
      i += 1
    end
  end

  def generate_row(row_num, prev_array)
    arr = Array.new(row_num)
    arr[0] = 1
    arr[row_num - 1] = 1
    j = 0
    while j + 1 < prev_array.length
      arr[j + 1] = prev_array[j] + prev_array[j + 1]
      j += 1
    end
    yield(arr)
    arr
  end

  def display_row(arr)
    arr.map { |num| print num, ' ' }
    puts ''
  end
end

if ARGV.empty?
  puts 'Please provide an input'
else
  generate(ARGV[0].to_i)
end
