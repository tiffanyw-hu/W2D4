def first_anagram?(first_string, second_string)
  first_string.chars.permutation.to_a.include?(second_string.chars)
end
