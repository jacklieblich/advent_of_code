str = File.read(File.dirname(__FILE__) + '/input.txt')
arr = str.split("").map(&:to_i)
sum = 0

arr.each_with_index do |num, index|
  if num == arr[index+1]
    sum += num
  end
end

sum += arr[-1] if arr[-1] == arr[0]

p sum