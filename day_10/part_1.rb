str = File.read(File.dirname(__FILE__) + '/input.txt')
lengths = str.split(",").map(&:to_i)
list = (0..255).to_a

position = 0
skip_size = 0
lengths.each do |length|
  list.rotate!(position)
  list[0,length] = list[0,length].reverse
  list.rotate!(-position)
  position += (skip_size + length)
  skip_size += 1
end
p list[0]*list[1]