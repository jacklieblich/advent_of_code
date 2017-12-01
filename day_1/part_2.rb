str = File.read(File.dirname(__FILE__) + '/input.txt')
arr = str.split("").map(&:to_i)
sum = 0

arr.each_with_index do |num, index|
	halfway_around = index + arr.length/2
	halfway_around -= arr.length if halfway_around > arr.length - 1
	if num == arr[halfway_around]
		sum += num
	end
end

p sum