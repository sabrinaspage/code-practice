arr = [2, 8, 5, 3, 9, 4]

arr.each_index{|index|
  continue if arr[index-1].nil?
  while arr[index] < arr[index - 1] && index > 0 do
    arr[index], arr[index - 1] = arr[index - 1], arr[index]
    index = index - 1
  end
}

arr.each{|i| puts i}