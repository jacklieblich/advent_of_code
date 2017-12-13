def get_size(num)
  size = 1
  while true
    if Math.sqrt(num) <= size
      break
    else
      size += 2
    end
  end
  return size
end

def get_center(size)
  (size/2.0).floor
end

#starting from second from bottom right, going counter-clockwise
def get_position_in_outer_loop(num, size)
  num - (size - 2)**2
end

#get row or col that isn't just 'size'
def get_other_row_or_col(position, size)
  size == 1 ? 0 : position % (size - 1)
end

num = 361527
size = get_size(num)
x_0 = y_0 = get_center(size)
position = get_position_in_outer_loop(num, size)
x_1 = get_other_row_or_col(position, size)
y_1 = size - 1
distance = (x_0 - x_1).abs + (y_0 - y_1).abs
p distance