str = str = File.read(File.dirname(__FILE__) + '/input.txt')
arr = str.split.map(&:to_i)
h = {}
count = 0

while true
  break if h.has_key?(arr)
  h[arr] = count
  count += 1
  max = arr.max
  index = arr.index(max)
  arr[index] = 0
  max.times do
    index += 1
    index = 0 if arr[index] == nil
    arr[index] += 1
  end
end

p count - h[arr]