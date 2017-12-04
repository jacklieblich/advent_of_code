str = File.read(File.dirname(__FILE__) + '/input.txt')
arr = str.split("\n").map(&:split)
valid = 0
arr.each do |pp_arr|
  valid +=1 if pp_arr.uniq.length == pp_arr.length
end
p valid