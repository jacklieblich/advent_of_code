require 'set'
str = File.read(File.dirname(__FILE__) + '/input.txt')
arr = str.split.map(&:to_i)
set = Set.new
count = 0

while true
  break if set.include?(arr)
  count += 1
  set.add(arr)
  max = arr.max
  index = arr.index(max)
  arr[index] = 0
  max.times do
    index += 1
    index = 0 if arr[index] == nil
    arr[index] += 1
  end
end

p count