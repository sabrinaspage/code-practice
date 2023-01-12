arr = [2, 8, 5, 3, 9, 4, 1]

arr.each_index{|start_index|
  puts arr.join(',')
  min = start_index

  # determine the new min
  # start from the beginning of the unsorted slice of the array
  for index in start_index..arr.length-1 do
    if arr[min] > arr[index]
      min = index
    end
  end

  #then swap the current min with the start of the unsorted array
  puts min, start_index
  arr[start_index], arr[min] = arr[min], arr[start_index]
}