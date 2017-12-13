str = File.read(File.dirname(__FILE__) + '/input.txt')
lengths = str.split("").map{ |str| str.ord } + [17, 31, 73, 47, 23]
list = (0..255).to_a

position = 0
skip_size = 0

64.times do
  lengths.each do |length|
    list.rotate!(position)
    list[0,length] = list[0,length].reverse
    list.rotate!(-position)
    position += (skip_size + length)
    skip_size += 1
  end
end

dense_hash = []
16.times do |i|
  dense_hash << list[16*i,16].reduce(:^)
end

p dense_hash.map{ |num| sprintf("%02x", num) }.join