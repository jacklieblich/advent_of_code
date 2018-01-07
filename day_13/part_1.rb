str = File.read(File.dirname(__FILE__) + '/input.txt')
ranges = str.split("\n").map{ |r| r.split(": ").map(&:to_i)}
@depths = Array.new(ranges.last[0] + 1)
ranges.each do |range|
  @depths[range[0]] = range[1]
end
@damage = 0

def scanner_location(time)
  depth = @depths[time] - 1
  arr = time.divmod(depth)
  if arr[0]%2 == 0
    return arr[1]
  else
    return depth - arr[1]
  end
end


current_spot = 0
while current_spot != @depths.length
  if  @depths[current_spot] != nil && 0 == scanner_location(current_spot)
    @damage += current_spot*@depths[current_spot]
  end
  current_spot+=1
end

p @damage