def my_min(list)
  list.each do |el|
    return el if list.all?{|el2| el2 <= el}
  end
end

def my_min2(list)
  low = list.first

  list.each do |el|
    low = el if el < low
  end

  low
end

def sub_sum(arr)
  largest = arr[0]
  sub_arr = []
  arr.each_with_index do |el, idx|
    arr.each_with_index do |el2, idx2|
      sub_arr << arr[idx..idx2]
    end
  end
  sub_arr.each do |el|
    largest = arr.reduce(:+) if arr.reduce(:+) > largest
  end
  largest
end

def sub_sum2(arr)
  largest_sum = 0
  arr.each do |el|
    if largest_sum + el < 0
      largest_sum = 0
      next
    end
      largest_sum += el
  end
  largest_sum

end
