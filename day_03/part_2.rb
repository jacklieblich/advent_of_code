@puzzle_input = 361527
@map = {}
@map["0, 0"] = 1
@map["0, 1"] = 1
section = 1

def neighbors(row, col)
  neighbors = []
  ((row - 1)..(row + 1)).each do |current_row|
    ((col - 1)..(col + 1)).each do |current_col|
      unless (current_row == row && current_col == col) || @map[current_row.to_s + ", " + current_col.to_s] == nil
        neighbors << @map[current_row.to_s + ", " + current_col.to_s]
      end
    end
  end
  return neighbors
end

def sum_neighbors(row, col)
  neighbors(row, col).reduce(:+)
end

def add_number(row, col)
  val = sum_neighbors(row, col)
  if val > @puzzle_input
    p val
    exit
  end
  @map[row.to_s + ", " + col.to_s] = val
end

section = 1
row = 0
col = 1
while true
  while section == 1
    row+=1
    add_number(row, col)
    if row == col
      section = 2
    end
  end
  while section == 2
    col-=1
    add_number(row, col)
    if col == -row
      section = 3
    end
  end
  while section == 3
    row-=1
    add_number(row, col)
    if row == col
      section = 4
    end
  end
  while section == 4
    col+=1
    add_number(row, col)
    if col == -(row - 1)
      section = 1
    end
  end
end