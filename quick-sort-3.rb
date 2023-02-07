def quick_sort(arr, start, last)
  pivot_index = 0
  if start < last
    pivot_index = partition(arr, start, last)
    quick_sort(arr, start, pivot_index - 1) # first half of the array
    quick_sort(arr, pivot_index + 1, last) # second half of array
  end
end

def partition(arr, start, last)
  mid = (start + last) / 2
  arr[start], arr[mid] = arr[mid], arr[start]

  pivot_index = start
  pivot_value = arr[start]

  scan = start + 1

  while scan <= last
    if arr[scan] < pivot_value
      pivot_index = pivot_index + 1
      arr[pivot_index], arr[scan] = arr[scan], arr[pivot_index]
    end
    scan = scan + 1
  end

  arr[start], arr[pivot_index] = arr[pivot_index], arr[start]

  return pivot_index
end

arr = [7, 3, 4, 8]

quick_sort(arr, 0, arr.length - 1)
print arr