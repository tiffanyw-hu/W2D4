require 'byebug'

def first_anagram?(first_string, second_string)
  first_string.chars.permutation.to_a.include?(second_string.chars)
end

def second_anagram?(first_string, second_string)
  first_array = first_string.split("")
  second_array = second_string.split("")
  first_array.each_index do |idx|
    second_array.each_index do |idx2|
      if first_array[idx] == second_array[idx2]
        first_array[idx] = ""
        second_array[idx2] = ""
        break
      end
    end
  end

  first_array.join.empty? && second_array.join.empty?
end

def third_anagram?(first_string, second_string)
  first_string.split("").sort == second_string.split("").sort
end

def fourth_anagram?(first_string, second_string)
  first_hash = Hash.new(0)
  second_hash = Hash.new(0)
  first_string.each_char do |char|
    first_hash[char] += 1
  end
  second_string.each_char do |char|
    second_hash[char] += 1
  end

  second_hash == first_hash
end
