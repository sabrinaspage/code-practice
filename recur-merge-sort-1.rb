# A = [1, 5, 3, 8, 9, 2, 5] -- midpoint is 8. A.length = 7. 7/3 = 3.5 = 4; we split into 4 and 3 by rounding. these will comprise of left and right sides
# [[1, 5, 3, 8]] [[9, 2, 5]] -- midpoint of first is 5 and 3. length is 4. split into 2 and 2
# [[1, 5] [3, 8]] [[9, 2, 5]] -- midpoint of second is 2. length is 3. split into 2 and 1 after rounding 3/2  1.5 = 2
# [[1, 5] [3, 8]] [[9, 2] [5]] -- for all with length 2, split into array length of 1
# [[1] [5] [3] [8]] [[9] [2] [5]] -- all arrays have length 1

# [[1, 5], [3, 8]]
# [[1, 3, 5, 8]]

# [[9, 2] [5]]
# [[2, 5, 9]]

# [[1, 3, 5, 8] [2, 5, 9]]
# [1, 2, 3, 5, 5, 8, 9]

# [1, 2, 3, 5, 5, 8, 9]


# input -> arr
# output -> arr
def sort(arr)
  return arr if arr.length <= 1

  midpoint = (arr.length / 2).round
  
  left = arr.take(midpoint)
  right = arr.drop(midpoint)

  left_sort = sort(left)
  right_sort = sort(right)

  merge(left_sort, right_sort)
end

# input -> left_arr, right_arr
# output -> arr
def merge(left_arr, right_arr)
  if left_arr.empty?
    right_arr
  end

  if right_arr.empty?
    left_arr
  end

  smallest_number = if left_arr.first <= right_arr.first
    left_arr.shift
  else
    right_arr.shift
  end

  recur = merge(left_arr, right_arr)

  [smallest_number].concat(recur)
  # [small0].concat([small1].concat([small2].concat(...[small(N - 1)])))
end

# sort([]) => []
# sort([1]) => [1]
# sort([2, 1]) => [1, 2] # of type func merge

# merge([], []) => []
# merge([1], []) => [1]
# merge([], [3]) => [3]
# merge([3], [9]) => [3, 9]
# merge([9], [3]) => [3, 9]

# merge([2, 3], [5]) => []