str = str = File.read(File.dirname(__FILE__) + '/input.txt')
arr = str.split("\n").map(&:to_i)

steps = 0
index = 0
while arr[index] != nil
	steps +=1
	move = arr[index]
	arr[index] > 2 ? arr[index] -=1 : arr[index] += 1
	index = index + move
end
p steps