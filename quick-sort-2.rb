listy = [9, 8, 3]

def quick_sort(arr, count_i, count_j, midpoint, has_crossed)
  return arr if arr.length <= 1

  if has_crossed == true
    print "hello"
    arr[midpoint], arr[count_i] = arr[count_i], arr[midpoint]

    print count_i, count_j

    left = quick_sort(arr.take(count_i), 0, 0, 0, false)
    right = quick_sort(arr.drop(count_j), 0, 0, 0, false)
  end

  length = arr.length
  midpoint = (length/2).round
  pivot = arr[midpoint]
  
  arr[midpoint], arr[length - 1] = arr[length - 1], arr[midpoint]

  count_i = 0
  count_j = length - 2

  i = arr[count_i]
  j = arr[count_j]

  # print "#{i} #{j}"

  while arr[count_i] < pivot
    count_i = count_i + 1
    i = arr[count_i]
  end

  while arr[count_j] >= pivot && count_j > count_i
    count_j = count_j - 1
    j = arr[count_j]
  end

  if count_j <= count_i
    has_crossed = true
  end

  arr[count_i], arr[count_j] = arr[count_j], arr[count_i]

  quick_sort(arr, count_i, count_j, midpoint, has_crossed)
end

quick_sort(listy, 0, 0, 0, false)