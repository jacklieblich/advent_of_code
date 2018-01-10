grid = []
(0..127).each do |row|
  str = "ugkiagan" + "-" + row.to_s
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
  
  num =  dense_hash.map{ |num| sprintf("%02x", num) }.join
  grid << num.hex.to_s(2).rjust(num.size*4, '0').split("")
end

def remove_group(grid, row, col)
  grid[row][col] = "0"
  [[row, col+1], [row, col-1], [row+1, col], [row-1, col]].each do |neighbor|
    r = neighbor[0]
    c = neighbor[1]
    if r >= 0 && r <= 127 && c >= 0 && c <= 127 && grid[r][c] == "1"
      remove_group(grid, r, c) 
    end
  end
end

regions = 0
(0..127).each do |row|
  (0..127).each do |col|
    if grid[row][col] == "1"
      regions += 1
      remove_group(grid, row, col)
    end
  end
end
p regions
