def bubble_sort(arr)
  0.upto(arr.length - 1) do |i|
    0.upto(arr.length - i - 2) do |j|
      if(arr[j] > arr[j+1])
        temp = arr[j+1]
        arr[j+1] = arr[j]
        arr[j] = temp
      end
    end
  end
  arr
end