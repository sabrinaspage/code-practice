# A = [1, 8, 2, 7, 3, 6, 4, 5], N = 8 => midpoint = (N/2).round - 1, pivot = A[midpoint] = 7
# A = [1, 8, 2, 5, 3, 6, 4, 7], moved pivot to end
# A = [1, 8, 2, 5, 3, 6, 4, 7], i = A[0], j = A[N-2]
# move i to the right until i >= pivot
# move j to the left until j.index < i.index or j < pivot
# A = [1, 8, 2, 5, 3, 6, 4, 7], i = A[1] = 8, j = A[N-2]= 4
# A = [1, 4, 2, 5, 3, 6, 8, 7], swap i and j's positions values
# A = [1, 4, 2, 5, 3, 6, 8, 7], i = A[1] = 4, j = A[N-2]= 8, pivot = 7
# move i to the right until i >= pivot
# move j to the left until j.index < i.index or j < pivot
# A = [1, 4, 2, 5, 3, 6, 8, 7], i = A[6] = 8, j = A[5] = 6, bounds have crossed
# when j crosses i, elements left of i < pivot; elements right of j >= pivot
# the final destination is exactly where i and j meet (j.index = i.index)
# A = [1, 4, 2, 5, 3, 6, 7, 8]

# the question:
# should we return the final destination of the pivot in an array each round?

# left = quick_sort([1, 4, 2, 5, 3, 6])
# right = quick_sort([8])

# LEFT 1

# A = [1, 4, 2, 5, 3, 6], N = 6 => midpoint = (N/2).round - 1, pivot = A[midpoint] = 2
# A = [1, 4, 6, 5, 3, 2], move the pivot to the end
# A = [1, 4, 6, 5, 3, 2], i = A[0] = 1, j = A[N - 2] = 3
# move i to the right until i >= pivot
# move j to the left until j.index <= i.index or j < pivot
# j will cross i. even though it found a value less than the pivot, we cannot move further
# A = [1, 4, 6, 5, 3, 2], i = A[1], j = A[1] b/c j crossed i
# when j crosses i, all elements left of i < pivot; elements right of j are >= pivot
# A = [1, 2, 4, 6, 5, 3], move pivot to final destination
# final destination

# the question:
# what do we not know at the beginning that we need to know by the end to make the swap occur?

# LEFT 2

# base case:
# if only one element in array, return the array
# return arr if arr.length <= 1

# left = quick_sort([1]) => [1], so it is sorted
# right = quick_sort([6, 5, 3])

# RIGHT 1

# A = [6, 5, 3, 4], N = 4 => midpoint = (N/2).round - 1, pivot = A[midpoint] = 5
# A = [6, 4, 3, 5], move the pivot to the end by swapping w/ last value
# A = [6, 4, 3, 5], i = A[0], j = A[N-2]
# move i right until i >= pivot
# move j left until j.index <= i.index or j < pivot
# A = [6, 4, 3, 5], i = A[0] = 6, j = A[N-2] = 3, swap them
# A = [3, 4, 6, 5], swap; now, try again

# A = [3, 4, 6, 5], i = A[0] = 3, j = [N-2] = 6
# move i right until i >= pivot
# move j left until j < pivot or j.index <= i.index
# A = [3, 4, 6, 5], i = A[N-2] = 6, j = [N-2] = 6

# there is probably a while loop happening here...
# we can use a while loop to partition the array with two bounds
# and verify the conditions, which are also in loops
# the flag for the while loop will be if the bounds crossed
# because then left and right arrays have already been distributed
# and the rest of the array no longer needs to be parsed

# A = [3, 4, 5, 6], we moved pivot to its final destination

# notes:
# the right sublist often seems to be sorted. perhaps not always though
## technically we move the pivot to the destination i lands on before boundaries cross!!!!

# --------- ---------- ------------- --------- --------- ------- ---------- ---------

listy = [9, 8, 3, 2, 10]

def swap_on_index(arr, first, second)
  arr[first], arr[second] = arr[first], arr[second]
end

def quick_sort(arr)
  return arr if arr.length <= 1
  length = arr.length
  midpoint = (length/2).round
  pivot = arr[midpoint]
  
  arr[midpoint], arr[length - 1] = arr[length - 1], arr[midpoint]
  
  has_crossed = false
  count_i = 0
  count_j = length - 2

  i = arr[count_i]
  j = arr[count_j]

  while !has_crossed
    while i <= pivot
      count_i = count_i + 1
      i = arr[count_i]
    end

    while j > pivot && count_j > count_i
      count_j = count_j - 1
      j = arr[count_j]
    end

    if count_j >= count_i
      has_crossed = true
      arr[midpoint], arr[count_i] = arr[count_i], arr[midpoint]
      break
    end

    arr[count_i], arr[count_j] = arr[count_j], arr[count_i]
  end

  print count_j, " ", count_i, " ", i, " ", j, "\n"

  left = quick_sort(arr.take(count_i))
  print arr.take(2)
  # right = quick_sort(arr.drop(count_i))
end

quick_sort(listy)