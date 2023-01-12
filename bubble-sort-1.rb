arr = [2, 7, 4, 1, 5, 3]

are_ordered = false

while(are_ordered == false)
  has_swapped = false
  arr.each_index{|index|
    break if arr[index + 1].nil?
    left = arr[index]
    right = arr[index + 1]

    if left > right
      arr[index], arr[index + 1] = arr[index + 1], arr[index]
      has_swapped = true
    end
  }

  if(has_swapped == false)
    are_ordered = true
  end
end

arr.each{|i| puts i}