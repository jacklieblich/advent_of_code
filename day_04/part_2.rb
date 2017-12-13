def has_anagram?(pp_arr)
  word_arr = []
  pp_arr.each do |word|
    word_arr << word.split("").sort.join
  end
  word_arr.uniq.length != word_arr.length
end

str = File.read(File.dirname(__FILE__) + '/input.txt')
arr = str.split("\n").map(&:split)
valid = 0
arr.each do |pp_arr|
  valid += 1 unless has_anagram?(pp_arr)
end
p valid