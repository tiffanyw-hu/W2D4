def bad_two_sum?(arr, target_sum)
  arr[0..arr.length - 2].each_index do |idx|
    (idx+1..arr.length - 1).each do |idx2|
      return true if arr[idx] + arr[idx2] == target_sum
    end
  end
  false
end

def okay_two_search?(arr, target_sum)
  arr.sort!
  arr.each_with_index do |el, idx|
    return true if bsearch((arr.take(idx) + arr.drop(idx+1)), (target_sum - el))
  end
  false
end

def bsearch(nums, target)
  # nil if not found; can't find anything in an empty array
  return nil if nums.empty?

  probe_index = nums.length / 2
  case target <=> nums[probe_index]
  when -1
    # search in left
    bsearch(nums.take(probe_index), target)
  when 0
    probe_index # found it!
  when 1
    # search in the right; don't forget that the right subarray starts
    # at `probe_index + 1`, so we need to offset by that amount.
    sub_answer = bsearch(nums.drop(probe_index + 1), target)
    sub_answer.nil? ? nil : (probe_index + 1) + sub_answer
  end
end

# def bsearch(arr, target_sum)
#   return false if arr.empty?
#   midpoint = arr.length / 2
#   case target_sum - arr[midpoint] <=> arr[midpoint]
#   when -1..0
#     new_mid = arr[arr.take(midpoint).length / 2]
#     if new_mid + arr[midpoint] == target_sum
#       return true
#     else
#       bsearch(arr.take(midpoint), target_sum)
#     end
#   when 1
#     sub_answer = bsearch(arr.drop(midpoint + 1), target_sum)
#     sub_answer.nil? ? false : sub_answer
#   end
# end
